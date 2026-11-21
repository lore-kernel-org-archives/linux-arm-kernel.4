Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A54C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OWCwBUzC;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Az4Hnbry;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=kiXtSmVT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zTHlIUmDCvrpkduFYr0oVFq5R1k7q8xEe8JjZgfxKmM=; b=OWCwBUzCicrfO4xOBiy97hBn4f
	Jooyojor12ayVlBi27aZL6495IeGinatR2JEVPjiv+eEszslGmy40aDeL8y/LaJpoC6WjIRj1G4N5
	/REDwjmwCMgKNoDRdx30umBasPtarU+TCMpFpV+7EpmOU8An/+hm7PoYoy76kWb/H6xm63bEoTuzr
	dyKC4OeMkQk+YtdywvWVNkV3qaXlNWx4l5aPU3VRzhjt14miqRTxciqjxdkcAcjc3+iXGmSaLYa8z
	5b6sZFKmQK099Xd1A8A2SiYBA8iB9kvrZyvuVG9nek4VLsRj/YevJNnBfEQwXjRByaLtBAc1zs8lf
	dz3nClbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUnUm-0000000HP33-2M0U;
	Sat, 21 Nov 2026 15:59:20 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUnUj-0000000HP2O-0Pdy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 15:59:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795276755; bh=zTHlIUmDCvrpkduFYr0oVFq5R1k7q8xEe8JjZgfxKmM=;
 b=Az4HnbryfiJ9btHy2n5bBt9beotwNzP3QI2tithJndiKZCgxcsZbOhBmo3VSatcdkxzhiWhkc
 +A12542Lck4clpmIWSETH0GTdPzCKPV2uthkDHBmBCwNXBU8kWzGEzm3E4iTbaWGQbRDYuFA16V
 HDlOsukK+WWiBkwtbbWRJL13ofawEk1YCFITVBb4BUySpAJNu0yS1MfW99m+zMXI40IsuckXZeh
 migxsAABkBrbEx7fXmB05I9sEvRY/zSOwes3SK52i5/Q15DJ4ro2Zo7LkkY8kDfEx1P2vpHbyXW
 EeRJVJzdAauWnfH4dUqfcA7WhF1PEKEZw4305KBKVptw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795276755; bh=zTHlIUmDCvrpkduFYr0oVFq5R1k7q8xEe8JjZgfxKmM=;
 b=kiXtSmVTzfeG/DTqJNEcPeJUGCiVlt27fIP4ZogxtkhZF8/kifGGevqmOcamhNLAwpnSYJ/XH
 CQMa2biUauUpFc5nZGCVVI8Mjr7c6Y7TL0woxSvRICw2kwYqND2BvCQlmvhFEcN+z+SQrrNB6QR
 OoCjoFrU8wvDVr3ZPV8EuKE=
CFBL-Feedback-ID: 6b01bf98090687713cf33d91:78dc9c7cc38c4dbae0ec3000e8638727
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b01bf98090687713cf33d91
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linusw@kernel.org>,
	Ye Zhang <ye.zhang@rock-chips.com>
Cc: linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] pinctrl: rockchip: Fix pull configuration readback on RK3506
Date: Sat, 21 Nov 2026 15:58:09 +0000
Message-ID: <20261121155810.706866-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_075917_534394_88965D5F 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.0 (--)
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

rockchip_get_pull() is missing a RK3506 case and instead returns -EINVAL
for all pins. As a result, the pinconf-pins debugfs file omits the pull
configuration for all pins on RK3506:

  pin 0 (gpio0-0): ..., pin output (1 level)
  pin 1 (gpio0-1): ..., pin output (1 level)
  pin 2 (gpio0-2): ..., pin output (1 level)
  pin 3 (gpio0-3): ..., pin output (0 level)

Add RK3506 to the case that decodes the pull configuration from the
register value to fix pull configuration readback on RK3506.

After this the pinconf-pins debugfs file includes pull configuration:

  pin 0 (gpio0-0): input bias pull up (1 ohms), ..., pin output (1 level)
  pin 1 (gpio0-1): input bias pull down (1 ohms), ..., pin output (1 level)
  pin 2 (gpio0-2): input bias pull up (1 ohms), ..., pin output (1 level)
  pin 3 (gpio0-3): input bias pull down (1 ohms), ..., pin output (0 level)

Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Based-on: <20261120201540.672016-1-jonas@kwiboo.se>
---
 drivers/pinctrl/pinctrl-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 97a73f8c4f6e..cad602fa41ae 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3910,6 +3910,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 	case RK3328:
 	case RK3368:
 	case RK3399:
+	case RK3506:
 	case RK3528:
 	case RK3562:
 	case RK3568:
-- 
2.56.1


