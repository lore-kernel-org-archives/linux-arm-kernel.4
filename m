Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762E4606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 04:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qBNP+n6u;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=sPDKV+iT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EAy5odJxUmWsVwFV/2vgUwhg7YG87ANK0oB0alQGxyQ=; b=qBNP+n6u2wPtn8pZHuvuviBQ+6
	p2vsIK1JRBlyTO4xsC2Kzp9eiXezB7YCIlqcyIpmlj2Krl8kG0zOucC9AWJ6XDPvIemNp4e2bQpCe
	lSTRsXUA6r7YAatH2ozogbo4Id1BObQi3VrzodUaOTHbr0gu6Ao+ByTMClWK2FK5MABcpRy+3rCzr
	lUMc3LoozJPYduc6UBniDzTU8BcDXpZ9f2uyHH+deC6pEkhB3jZKfS/Fu3rNZZzLOH6CSbYKqXNh8
	ILXsOUND5vayIzCtd/DZPZwaIL0eEtr1mI+jT0kscGDXxApwbWdn4wjd7hFpKqEp0RT91hljES43d
	CVMKzRKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWR3Y-0000000C4Vt-1KSt;
	Thu, 26 Nov 2026 04:26:00 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWR3V-0000000C4VB-0i4g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 04:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795667140; bh=EAy5odJxUmWsVwFV/2vgUwhg7YG87ANK0oB0alQGxyQ=;
	h=From:To:Cc:Subject:Date;
	b=sPDKV+iTt8//ILSpfTsE51bhO/7s0baTTCeKWuu64guwrzSQ3j2MqaRUGx50r8Ki1
	 9vhG/JumJ5XrgHDHdkg03qg88CaYgo97xLl2Cd9QLEecfD1fodsAMZDW+MPQRLgXrv
	 MSO/EJLvMPFBFqaWy/xbD2gsDxZydE9yXhkRG4h4=
Received: from LAPTOP-A8STVENV ([117.147.100.214])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 665AF093; Thu, 26 Nov 2026 12:25:37 +0800
X-QQ-mid: xmsmtpt1795667137tj3jgb9h6
Message-ID: <tencent_3D56658FAE8FA8158A1175935B194992D907@qq.com>
X-QQ-XMAILINFO: NVJ0hJNx7N5SmnZarTRq6RbSHmOQt16wQiu1L9TiU5Wt3xTca+q2nOnJgjVqJ7
	 2SMHaE4yp/WijRCOVk+uJmHSDyBQdItWX0NbCe3L95OHDrbYOZ9VuzDlRrcEQTHNUtFVo0+Mt8Ex
	 ZkLgXtXLKoj8R5RyIcTsKtmCIhPPm9KlE/kGXwDAPqEnFfyhK4CV1po9UVoZlOrC4jSPI1DNCdKQ
	 NXZw04EIJ/Gs9xRQbh8VFTrdJQUJ+E0SrVb7jcOkxss9dT/f7dA6dwd3kpIA9grDh3E3zUNkS3OL
	 18NRRwLoMDfIJdp2DissuthIZ4R8DCfajvKslm7ZjPlaoNlMY4U/IbL/ATUpnG85KbcHpL8k+TFr
	 zsuT/KcIIUwC4PtLhMw48gXmHP2gHBHB4Fs/f2/AeyE5PMyjRnMiyhMfxlBoF7uGfOyZgAcUDVnu
	 kgBYUUKj1yl2jxT/Zl9JUp7CsuF0sJDsPE4Xq6hdkWauXRZlXLptKJodsuoZXemMjNTwXTCCtxin
	 JXlr6cBT3bhrrr2x3DJ6LXRDslipT5FKbZhBHNrp7lbK1wA67EZHx1M7dN3lRz7Y+cGENYp1EgaJ
	 cIrVrgm5Um+sacy5NPcNUOk5uFPEJECQ1iW6eiWOBuV0V7uQhoRL/fV+KhcSCNNXClW5bujWlLgB
	 YgDKzTwY6UUB6eF3CVrB8UwQvqmNNNtJRbHxCTBwtMHAul/Rc4CQI4tgKEy9HhY2xV3tQSr0D56R
	 F83H52nufOUMQQX6Sx/J/a3kB7aVYQxCE2p9v5NVeIGmA/MjW6uWF//FIIS4o7D5GMN+SoAXBuNt
	 b4HEeiXunNidN4mVJShbNzY03Zx/UxIcMSxSSpMnqUlq4rAK6oM548N455fTNsp9Q9R9AcKi/GrY
	 RwOL8XkFJCC+Whd2MXHMUQgtpO/rxqz0TxHkEt07IzBz0chk6h59m+YbJToU5xM6jiatQLHsLvlk
	 xllO76PfLoWaDue7IS9aB83cG7IEj33wZuFVt+EAL2zuXqh6AR6Jl5Z+mBQnxyx71vaf4tBOSgd5
	 pedWrr7onuG2ZYTxO1
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Yuwei Chen <2522445001@qq.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pmdomain: samsung: fix device node leak in exynos_pd_probe()
Date: Thu, 26 Nov 2026 12:25:37 +0800
X-OQ-MSGID: <20261126042537.206-1-2522445001@qq.com>
X-Mailer: git-send-email 2.53.0.windows.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_202557_763004_C4DC3D66 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

exynos_pd_probe() looks up the parent power domain with
of_parse_phandle_with_args(). The caller must of_node_put() the node
returned in parent.np. of_genpd_add_subdomain() only compares that
pointer, and probe never drops it, so each domain with a parent leaks
one reference. child.np is assigned from dev->of_node and already
belongs to the device.

The lookup runs from core_initcall. The extra reference pins that
static parent node for the rest of the boot.

Drop parent.np after the subdomain is registered and after the
messages that print the node.

Earlier trees keep this driver at drivers/soc/samsung/pm_domains.c, so
this diff does not apply there.

Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platform driver")
Cc: stable@vger.kernel.org # v6.6+
Signed-off-by: Yuwei Chen <2522445001@qq.com>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index c8c2ea06e990..01017c406fe6 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -153,6 +153,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 		else
 			pr_info("%pOF has as child subdomain: %pOF.\n",
 				parent.np, child.np);
+		of_node_put(parent.np);
 	}
 
 	pm_runtime_enable(dev);

base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
-- 
2.53.0.windows.2


