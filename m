Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE1F606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kPPmOccM;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=QH5c9UDx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MPHGMKGLL0OSZ80y6M4OLHQpLzHyeIj4vIBfwx7QpDE=; b=kPPmOccMxMniZg
	N6saXLsfRVYduAkuikAxI11uTp2qWW90EBnDqWyRbqc8093Ca1NDGBi4ceHafVr37Pxxy1WlDMdkb
	XaGZXsexkSr7Baw4WY0qJPfiZkuzDpQiv1DQYUuNtdpP2rJj0wws8SjyNEmG4IMow31IN0nV4XRg0
	fJv6bQSWtqtbZwHfTv+XfhMo75ixfkZdoXcW/vgzzutsHrIbRAq9zQqkEPTnqeAd128DwwgOElkxr
	+dEC7lVbrdISfL1SLog6SXCAYXL7JAglS1UKEx3DWZXN3khKoqpN1edX68tja34CWXzotRDtxSPUZ
	a7h0mShuqOkrTg4d3cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI5P-00000001yw0-4A2g;
	Mon, 23 Nov 2026 00:39:12 +0000
Received: from out162-62-58-216.mail.qq.com ([162.62.58.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI51-00000001yfJ-0mwQ;
	Mon, 23 Nov 2026 00:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795394322; bh=MPHGMKGLL0OSZ80y6M4OLHQpLzHyeIj4vIBfwx7QpDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QH5c9UDxLuIGDbj7QKUigYVqiRMBvIikUOl0D6Z3KtTUDLj6oc1XDm6wYx/yWyIPz
	 NtBdRIV3CECrtN3COd//5WKAKTPlqBi7K2n1wHlgf3Vn3y7WY5e1mY1zI0aawMFiCy
	 iIJESl021ybK8oxKikRxVbmAo76//uvuGkhIr4y4=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9A63524B; Mon, 23 Nov 2026 08:38:38 +0800
X-QQ-mid: xmsmtpt1795394320tadcorimq
Message-ID: <tencent_452BA245FE6A7C7308A5121F5281E9E6A807@qq.com>
X-QQ-XMAILINFO: ODQfruXGvXmaHGSflDLohQ+6OBZ5C7KLyZZc0k68wD8z/EV4BhvQ4ZJ1Q3zrFa
	 AV8ezUNgi2XjsU73Iwekk1iuRIHUyUeRrFVUrpv14Y9BrZj6m95fZPMd4JHCIAh8nxSitiVgFqEO
	 sbc7w3XMxcB4O0P774wE1IxSgexo6y6wWIkomPnX/xSrCJR+1nbdVfX4lGCkIBr0RkF1zOgU4/Nb
	 GTLbtz2g+ih+i9Q02wioMzE0d3KkOE+fhT1yJHl0KN86K7fmI4l4AAm4g6eQjtKWnhDTws5Q1wl+
	 qmmLjgxQu0pZYLeTHtXYlKICt7qIbIAq+LsGBNFq8HCmB2BzpzQBxMCqlX08vZQOkZOIJUk0oPCR
	 w15sBzrehReaLjQMP070Sd31IWf3FAtWS0BnJzvNVb6R/6Jml2GC1J97wUKXcokLPDmfMDMojcFx
	 RUreQWCi0/7iK6yEupiqKymKC8Eh02FFUqDtjK1wvm7iCrIKGh61qlb7JZWQVdZ9yA6vzD+M3Atl
	 8JxDHYvJtS8mzf4X5kIqJ3JB/xEla1WiOY1+qPnA6XdmKB+0qiUtmh1iB+nMxF+nFwLNF86/2GVg
	 QKwyzOYfcc+8gg0FNm8TkcR/uoMQ88YB5yhM2YlX+h4JjAQZyoSX1iZI5iCAYGbTSKayP1XI3mhe
	 4amZYcYsTyKtUJaJ0xQs9Q8Ext0s9c3pnwuzb7yiEJ6K3ZHaQYqVGb7UDYZwS3FYA8TXKd2pWejQ
	 f7WObn0MWcCkvp9VOliJ2eKp/mtPBM4hMa6yKSepBrA8yx2bZEMfBrg4kWgGiAUM5GanfasCOvmR
	 EP3nGkh6580kQqfw9d2xz5wXWILUiBq6PVcDWQNNsHpM8zvOSAME+AVmc4hsAfV5nAxG2SfExSFW
	 5fi9bPbuWHbY5yEY2OkWqFTmQzLJn57Z4eUBphdfcFvbPjAX/Wy80sfAEzBpeK3UGZ8/15JB1mPp
	 LPaN3o4i5YzZjnCHpUkGFOKfpa8oQkdu5sDoLJrmfnMDe06Fg1I17zQKNez9TZhrur+9fuJVaUWv
	 A3RxeNS/igwuijzN4dc3F0WsTXW4uctB1ecYUo3PjWEkF7XdA3yDQhrE11ebDtfT7GXZ1NjHi7Vz
	 tNHxwMCKuy7Q6PF/69XmUH3cs/6aRdDjirw1AFtcJ1CkATpRxr+xHeEXaNLyYl5efUPSKwc/QF5n
	 5ehfCsKHpBGud4x5FJRjfKBC5ikpiKlOsGvBWBupe1Fs7R4Q==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: soc: rockchip: Add RK3506 GRF compatibles
Date: Mon, 23 Nov 2026 08:38:34 +0800
X-OQ-MSGID: <3264c450b28efcb6ced51719182315728c15bae8.1795394137.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795394137.git.1194781887@qq.com>
References: <cover.1795394137.git.1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_163847_743711_778CBA10 
X-CRM114-Status: UNSURE (   9.39  )
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

Document the RK3506 system, IOC and PMU GRF compatibles.

The PMU GRF is named rockchip,rk3506-pmu-grf to follow the
rockchip,<soc>-pmu-grf convention used by other Rockchip SoCs instead of
the vendor's rockchip,rk3506-grf-pmu ordering.  It also has a
syscon-reboot-mode child, so allow the reboot-mode node for it.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
index e94c83d7..1fb1bf87 100644
--- a/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
+++ b/Documentation/devicetree/bindings/soc/rockchip/grf.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3288-sgrf
+              - rockchip,rk3506-ioc-grf
               - rockchip,rk3528-ioc-grf
               - rockchip,rk3528-pipe-phy-grf
               - rockchip,rk3528-vo-grf
@@ -93,6 +94,8 @@ properties:
               - rockchip,rk3368-pmugrf
               - rockchip,rk3399-grf
               - rockchip,rk3399-pmugrf
+              - rockchip,rk3506-grf
+              - rockchip,rk3506-pmu-grf
               - rockchip,rk3562-pmu-grf
               - rockchip,rk3568-grf
               - rockchip,rk3568-pmugrf
@@ -234,6 +237,7 @@ allOf:
               - rockchip,rk3036-grf
               - rockchip,rk3308-grf
               - rockchip,rk3368-pmugrf
+              - rockchip,rk3506-pmu-grf
               - rockchip,rv1103b-pmu-grf
 
     then:
-- 
2.47.3


