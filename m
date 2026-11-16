Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0314606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aTH3Zwer;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nr5TCW+E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z/bRCXejfhUAGNyTypvLnWT3Js4ffEtsgZQ/cFVYR6A=; b=aTH3ZwererRfeL+Nb+mIXYZeQ3
	JUkRWdN52BElESU1MKcuO8zEWt4IVMcz5lJqyFnvVc3eX+WfW1fWytc7yV5Efn37w0Ii5R7dLB+WK
	7fBTA3Rk1eB3ooadw9TQ0PYaG+JmyWfFKs2OgmcKXDqkZFM8ACe72XJBU0Ov5pF4b7LAyZ9ltyn8x
	OskCoKF9LRvzo+776bcCbd1arRMwbgddtgYZ4xyPj6sdtAQT61A6ohXFqrrVEQ/M+yYonBgVR730x
	/Niev7si0o1ROzoQP29yzsxnAr4qRfXppRceiWVWPhX0nrB139duRSxZbroJLMP5abr91U5QVnBCk
	+QKAn0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvr6-00000002MCo-2bWn;
	Mon, 16 Nov 2026 12:30:40 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvr3-00000002MBj-1VYv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:30:39 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso20297a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 04:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832236; x=1795437036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z/bRCXejfhUAGNyTypvLnWT3Js4ffEtsgZQ/cFVYR6A=;
        b=nr5TCW+E7nlbC61dyERnaokw2HgA79wwev76oWJlfhyjLzvlQvcaecb76uat/c4JfE
         Hv1GayeMqTmnycKbRWm4L17T6YURuLMlCYvsIxkxCBK6CU6LfHa1baOov3hQ4CbN27TI
         e0AHu+m4JxZIMzugsEdWZ5GhGd/jufVjZBgNiWMEMuMSiThXqgyvxHnvoYIdB9S+fc+O
         kdI8YB0Fz4bnAQUCMgWrLiWFQuv1XEEqMsF24Ed/1BJFsQGJ8lIM4DmyvlUwOBKpQqjV
         pFSULE5uvKZPgjaWfURCcUt7OAWl24Qxje2S7ZInCRJ5pB6p1+YcgRJRD2dBblYs9uY+
         FjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832236; x=1795437036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z/bRCXejfhUAGNyTypvLnWT3Js4ffEtsgZQ/cFVYR6A=;
        b=CiGCQDEVPKadxCCYhwmFEQXImnom56l0k7PgDzN+eG/9hbI8/jUAM0WzmG7+bl33jN
         kSYnFyvBPdtJik11SuVQwMenhMRy1xxhncrHuRGJPXWONFMk0hUHN8BSAwMpSsgWGKM4
         QRpgnZCVXFKjEZPOkK8BoOV+JrXA1esy8pJgykBnDP5UDUEI7etKMvk1UDnPLnJ+QOIV
         ILY7E2HzOHqM4GTIzQ/jequRw+KXNLtdVdfW3+v704SIuv0U+DvAZ+jey0u7hE1tqsQH
         LKPDRDWNopWByUhQBD9/PeNwhGEUorooaPpcQHXaadbngQKmqKHdG1ncn2E+iBUzskUB
         24RQ==
X-Forwarded-Encrypted: i=1; AL+hErGykLOXyWiXY6yP68HS6cOqYo60vDpOr2jKO/k38mw/tzi9T/OFUlI07jN/rwn2dRw1jDvkmM2pKXrliY3A6wCI@lists.infradead.org
X-Gm-Message-State: APuU4Z/M4Ue+S2HixhwjBJFpiE+E0P/QacecLyChwlIeR1CIj0Kygst2
	LVlkAal7IGhWoJX7+UdSaboiGVF8hM83YOsa+RXO2SuTyQVrmt+BlYod
X-Gm-Gg: AZFdTZf9Di2ShntQ1hoR5hqU7J5dXbXus5EaFCO+xwUB1uDQE3XOcd79l8G2F8i7fH/
	bA89+nRUwhYgNrnpJ5TyVERhsrHgCtlX7UyXBCObgwdHlXAd3EDPR7QWIA5fn/UivJt6MvM/Noj
	8eE/3dGzw0ZTK8Stx9PzVrF1idqItryoTRQ6DA+kNwt403IkQBlun6+sO5AUtVjgqjkqaY+gQkn
	Nq4j363imJl+VHnw2bE129s0KaE/Fj0g6AqAYn4gKlDodQl0fHmeOc+O00QsU3/s0nFHayztJxi
	9JUVKv0ai/gONTBjAMy5Z/4OX7c/Iz8El8h3bfTy629CgqSUU1qtm6uWIQrj3dXKT7cDA1JDtWu
	WdeUyWBcDqdNTcnEleRy8njrsih3QLkF2WrphgH50jxxMd6gsCWzOkFJzRZsTww5vjDFjVjLfiL
	EW68xcv2HpaY8+POPuRYEDFDACSAMSIbcY1QVcVwSmST9DC658qWKdXDEUyGcWR1V/QIbJzetmh
	C3OB2Cpgc7Y+kBMTi1bTLf57Ifq1+oF2gnf318L8eGDMnRtdaKKsu4VoevPWrc6xjh5KZUVIP72
	NsSr/7tnUjgQsixxnlv64gYr0px1Y4H1yqhHLmU=
X-Received: by 2002:a17:903:1844:b0:2e2:e24e:a88a with SMTP id d9443c01a7336-2ee0da7f49emr93338495ad.22.1794832235891;
        Mon, 16 Nov 2026 04:30:35 -0800 (PST)
Received: from arch.localdomain ([152.175.35.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4acd77sm37607385ad.3.2026.11.16.04.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:30:35 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Damon Ding <damon.ding@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v5] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Mon, 16 Nov 2026 20:30:24 +0800
Message-ID: <20261116123025.638531-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_043037_392150_BA855118 
X-CRM114-Status: GOOD (  16.82  )
X-Spam-Score: -1.9 (-)
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

The DP PHY is optional: the Rockchip RK3399 eDP controller has an
integrated PHY that is part of the Analogix DP block and is programmed
through the controller's own MMIO registers, so its DT node has no
"phys"/"phy-names" property. The other supported Rockchip variants
describe a separate PHY and are unaffected.

devm_phy_get() therefore returns -ENODEV on RK3399 and the driver logs a
misleading "no DP phy configured" error before falling back to a NULL phy.
Use devm_phy_optional_get() instead, which returns NULL when the PHY is
absent and propagates any other error, and drop the open-coded -ENODEV/
-ENOSYS handling and the spurious error message.

The behaviour is unchanged for both CONFIG_GENERIC_PHY settings, because
the real implementation never returns -ENOSYS:

- CONFIG_GENERIC_PHY=n: devm_phy_optional_get() is a stub returning NULL
  (devm_phy_get() returns -ENOSYS, which the old code mapped to NULL).
- CONFIG_GENERIC_PHY=y, no PHY described in DT: devm_phy_optional_get()
  converts -ENODEV to NULL, exactly like the old code, which mapped
  -ENODEV to NULL in its open-coded check.
- CONFIG_GENERIC_PHY=y, any other error: still propagated, as before.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Damon Ding <damon.ding@rock-chips.com>
---
Changes in v5:
  - Fix the comment and the commit message to mention RK3399 only.
  - Link to v4: https://lore.kernel.org/dri-devel/20261115053625.404795-1-jerrysteve1101@gmail.com/

Changes in v4:
  - Rework the commit message to explain why the behaviour is unchanged
    for both CONFIG_GENERIC_PHY settings, with one bullet per case, as
    requested by Luca Ceresoli.
  - Link to v3: https://lore.kernel.org/dri-devel/20261110023721.2014061-1-jerrysteve1101@gmail.com/

Changes in v3:
  - Add missing changelog entries and reference links
  - Link to v2: https://lore.kernel.org/dri-devel/20261013134659.335829-1-jerrysteve1101@gmail.com/

Changes in v2:
  - Added comments to explain the changes made.
  - Link to v1: https://lore.kernel.org/dri-devel/20260924020417.868588-1-jerrysteve1101@gmail.com/

 .../drm/bridge/analogix/analogix_dp_core.c    | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 6df6963740d2..6d50ffdae17f 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1426,21 +1426,13 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 	if (ret)
 		return ERR_PTR(ret);
 
-	dp->phy = devm_phy_get(dp->dev, "dp");
-	if (IS_ERR(dp->phy)) {
-		dev_err(dp->dev, "no DP phy configured\n");
-		ret = PTR_ERR(dp->phy);
-		if (ret) {
-			/*
-			 * phy itself is not enabled, so we can move forward
-			 * assigning NULL to phy pointer.
-			 */
-			if (ret == -ENOSYS || ret == -ENODEV)
-				dp->phy = NULL;
-			else
-				return ERR_PTR(ret);
-		}
-	}
+	/*
+	 * RK3399 uses the Analogix DP controller built-in PHY,
+	 * no extra PHY configuration is required.
+	 */
+	dp->phy = devm_phy_optional_get(dp->dev, "dp");
+	if (IS_ERR(dp->phy))
+		return ERR_CAST(dp->phy);
 
 	dp->clock = devm_clk_get(&pdev->dev, "dp");
 	if (IS_ERR(dp->clock)) {
-- 
2.56.0


