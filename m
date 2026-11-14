Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EB1606A8BB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 02:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DqRXUnhD;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=VOGrEs3S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sb9604ZqOKnL5jLlbCzKt/eW9EFcFKIgFhhBj61S3cc=; b=DqRXUnhDpRPLK8
	FdSYUXG41M3s63y08OIKhO4Cx5j71xIHnXjFcdEx7OmFl829RFhjwxYpiAkDVN5NghlVAscVM7p6h
	gakAGQKwmZawFjjIOIW9cUBJWXP1YhyLU/WnORQRkl4nYPQOJnAQ6tumyy0S6SRouQYavCqzdL1EU
	GUopjtoXAHuPsvd8ToHM0X7JIthIoJ/diHr3m8g30wzo8gqRkrdHr2tFAJ/OLTjFeY841Udco4JI5
	qbU/fTeToxBY1HfqTqCH6X8JePNYFrZ7d9fEVwWhzDLfUEL18T8utZ2utRvxIK+hvUqc2L+mUIYsR
	0DYoAbv1Yy836CY5eMbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS34t-0000000F5HQ-0l0k;
	Sat, 14 Nov 2026 02:01:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS34X-0000000F501-16ip;
	Sat, 14 Nov 2026 02:00:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621650;
	bh=VLIkL6wE7wYf6uwe+nUboRMEv27Th4EuZ1ktfV7x+0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VOGrEs3SEfb2O1JGXqkFER85j3kylyK21P54tEJaVOSd2uSE0nDFLkYvi2dE1sCtL
	 N0AP4n8CRQUvrvoUFbxKJ3lKf7r17CpCCA2zUXdlIGNmF5lHapaYep3aik3kbjlt3v
	 9R5y9xmwt5OadS2QWkgBM5xAQ8audxrKxnyS3WMGBHofSqyrMHnETDDbTwBlW08h2q
	 LkQ1JdFJg4UKhHBOfKbByCFD5F9itbfZQn7GJmL1ARSI+x/jIwA11oNyhIoVGrhcy9
	 xKoBLKNbp6DjPPpt3u2IJTsChYtZ0pEqcSdol5InFhdWLh/dTLglXS7OTf/ElZTZe7
	 0qsbGaAG133zg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4CE517E00DF;
	Sat, 14 Nov 2026 03:00:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 72E0448002B; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:28 +0100
Subject: [PATCH v17 1/7] phy: rockchip: usbdp: Disable USB3 port during
 normal power-on
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-1-1af5f566408e@collabora.com>
References: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
In-Reply-To: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=VLIkL6wE7wYf6uwe+nUboRMEv27Th4EuZ1ktfV7x+0A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNI3Q09lVEh9vK68qQFwxbdNs2fLs3A0w
 252NN7JTJIR24kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qabkMP/jfNR8fFVxMyy6j1Sc5gr/RZy1L8eFE0h5llu5SBKbVDIhGMTnbHmc+9YmZ3JekPgnN
 aC6blax/fsVgs/GCYz/5Ed9GRv9gY50i+Q4UT+PCugBFWBRayeK+bMqKg3FJbfBlXVtwLAIilTU
 RTssrOrDkZPILYzf27ASe22Eq9bxY77/igdRT6GcT05QQjWVtMjLIffwjPUkk8mYxVFQDNK1cnd
 ty916iY42LMwxEtCHXQfng6cS1NBK8V9BQSMWMqXFulrcxsDEOdCv8l2Q4062eiYUWbBgAXPHXY
 3sP4HiasC4llN3pT4zahF3HTlym7U1m5a5ruyLzRQC7HjV0voZ5K1A9qZ5rt2/QTuMMEHq8NgzM
 f2+M3lLoUNaaO/g0SDSQGn5M1LfD7RQkCCeu0BKPgm1bP0eI88QAPhVMdofJKrfcCalbhAOO5MA
 KN80f7zsRUO0tL6l1/mL4dZo9iyU0J3YRvxAi/Kl0jUwHq08g5HgSZqXf+stFtnAGg6Vc5eTQMN
 hUMcGRlowgb8vHIj8lFb3F7KnJRu5d/MlRjrgXjrW5V/OFKrwriOjkelp6cUrqnbu7agaSINzPU
 qLoLoT38Wbwk68/UYJm2eEAwXVdEz3peEJIRa53DfTLnHfnGw7UWT2fGOCm4sZLbMv1CY07RccE
 77VzGLRCHlE6DNu3UpsUm0A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_180053_478010_E2DE5847 
X-CRM114-Status: GOOD (  10.74  )
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

In the reset path, the USB3 port is disabled. This re-routes the clock
going from the PHY to the USB3 controller. This adds the same to the
normal power-on path, so that it behaves exactly the same (except that
the clocks routed to the PHY stay enabled in the reset path).

This hasn't been done so far, as it requires the recently introduced
PHY reset infrastructure to avoid the PHY PLL not locking during
startup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9c6d921b9191..d01a819bf794 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1051,6 +1051,9 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	if (udphy->status == UDPHY_MODE_NONE) {
 		rk_udphy_run_reset_handler(udphy, true);
 
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);

-- 
2.53.0


