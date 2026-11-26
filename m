Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CA1606A695
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ltCb7rh8;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YSxwHOVA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sPahzrcvT3RZFJ8PseMpGem8/LBfIlO+73qMBgTYdqo=; b=ltCb7rh8uQUHDf
	viWIOVo3o68Np7c7+aIQCGVrnPPTxWvPvIW/+pdWzZg2c40A++kko2YrH105o67dESnzk5EPb002v
	iOvvG8EPzScheARnZUAFRhMURQYIrTEKxhylI1jEawmwA6XOW0+vhYscdvuJnhDmnJD9IhQCZeveg
	ILid1XFnKY0k36T8AVu/QwP4dCjo1X2Q4A/rCffGRPbdNCUA0XcTupHgCC6Cwl/PVqJqECIuIuNTC
	GVMYOZ8ggWEX2/YMooysCpTOdX15pM/3/Rb27nIfNlvx/hMub3yXPBUXQlrPw7P3BLN9leourZKPX
	qL9R/C9cVaLeMrLsIOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaqW-0000000DcK1-1lvH;
	Thu, 26 Nov 2026 14:53:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaqS-0000000DcEw-02Oh;
	Thu, 26 Nov 2026 14:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704784;
	bh=P+04Z1MX3zoNRz5DSJxgK1log1B1KePm97Us5+d/6J8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YSxwHOVAARaqm+emsVcEV7p/Lb8Pg4ucF+SuCFYL0OpuJLPyRmkxq/uCVsrXwa9YK
	 HQj3RICR1vgemSPp8Izz02BzkENLbBideQrrIqjrEBwSx7f7IVp5JvVFriuuQ+eqNE
	 kAR9/hzw44O0Gn4/JefQ5qrNwok0kRskJ/x9+nvkF+UjWpJbXAw5jtbnio9PtqW+V9
	 Vx2JP3wlhB+qDbpBiDxhgTlUA19RYxmeXvTRLjsilLF/J26l1SyG6KwNUpFmOBFK5p
	 2hUO/ZBOwp6HpLT7tj7ALSD41Smr7VxsCSwBgPVO+KyooubVjDCKZQ79md0+I7j/8S
	 BzQjFghsoEe+g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3DB017E07B5;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 61A9A480030; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:37 +0100
Subject: [PATCH v3 2/6] dt-bindings: clock: rk3576: add more DFI clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-2-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=935;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UfwNA4f0pWBVqpKkpibVMUgMqkfCfa2mC1buwCjD6uw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9B3WOcP1GduoK97tw5PPWHVXhsahY3En
 1led8hJyUCuyokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qaZBwQAILu2HobZ0WzFan/BMl502xHBwxP+3ze+9PGL9e9sxbJXC0TEYOMTeMPn10qKb+M7YR
 h4FkUSFrz35w36JLDwezHM2Zp6c9PKYmw9ozstD3dch4iPgQb0nZZWtc2Kgj+f+RkDsW4HEaZgN
 MEZe/qCZKJQpAdMROWbqRuLP+Tc8rmc5CslovNygWKqw8muEdWnC5rN4+VwZpJMjfqKgJXAb0f3
 to9RSXQd/ThKUsrS0SzFoRBiBX5SOAUouC+J+wj45q5kgXiaLmTX42XpYb82mA1S4uGFov/z+nS
 w6iTki7gtzKjoOZyRaNmJ0tMtCdq787XpYrWk6Rf7p29oIfIcim8WquSyr5H1MBWRGRYbkWegR+
 x7+wTAqyQ8eSDaP9OAC5nKVyEolZqll0C+69633MmK8tMOy0zTEZHgva0VPfn6sbfjI/pJeZk2E
 k5keYyY2UT5Dcf+iHKLXQJ9wsdKo6oViIapHGMwuuQwvWfZOwI5lxJ1QiXdP8DVv8JwMQA6Il8r
 Apseu/CLDua8NivoWX5krHcV7Mqi/reesym4fczPr2EY+gyV30KbJQwNLjyeADHvy6k1xY1zYB4
 OkT58o4SoelU9jD7hyM6Nh/HplPpSRCpXSr+CjrfuY1fSGdhfVCv3sVGojHigLeVrd/Pw5c/j5w
 w8LKQz67E5ddp5YM5Ezg1Rg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_065309_736252_9D206572 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

When the RK3576 CRU DT binding got upstreamed, some DFI clocks
were missed. Add identifiers for them.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3576-cru.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3576-cru.h b/include/dt-bindings/clock/rockchip,rk3576-cru.h
index ded5ce42e62a..c5b74f2d8926 100644
--- a/include/dt-bindings/clock/rockchip,rk3576-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3576-cru.h
@@ -604,4 +604,10 @@
 #define CLK_FSPI0_TO_IO			576
 #define CLK_FSPI1_TO_IO			577
 
+/* Clocks that were missed initially */
+#define PCLK_DDR_MON_CH1		578
+#define TMCLK_DDR_MON_CH1		579
+#define CLK_DFI_CH0			580
+#define CLK_DFI_CH1			581
+
 #endif

-- 
2.53.0


