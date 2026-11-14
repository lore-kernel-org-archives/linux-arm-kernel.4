Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757B6606A8A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 11:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p9W5Qqvh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nkz6IOsKVX4CAJi41DV4Lpiz9U6GxjKdS2J9FEVnLac=; b=p9W5QqvhMy8nRtFrnuy++Nb2qU
	LZPUSRCQYB1p1Jt4g52F0GVNnD16XNUWWk5FWumpU1QX6ujmlytBm0reCMlSZztEoYyt8rJHiLT63
	kLxI0Egah85jcdBDrk64KmnhSH3c1NtnYCa92h+onIUjZT/7QjP2gkJFdT0awrCG2GYbJ9iq8KBSE
	k4JNbx406kACuJXjBCXM3aCMLuC2x93wk//CS/YvVE49YtGlMkJMJ9CtL2TNbGOl5poVKXnsel89S
	s2KXDgYTleQ+NE2E2WAT/3uB/iiQMlXZEyX00MAKxtU142l1hPGq0cnP9mm/M0aZOs92uBs2DXJYT
	4gMOK2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBdt-0000000Fri6-3c58;
	Sat, 14 Nov 2026 11:09:57 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBds-0000000Frgx-00fy;
	Sat, 14 Nov 2026 11:09:57 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xSBdk-000000003y2-0SSB;
	Sat, 14 Nov 2026 11:09:48 +0000
Date: Sat, 14 Nov 2026 11:09:45 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>, Marc Zyngier <maz@kernel.org>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] media: rkvdec: vdpu346: Limit HEVC EXT SPS RPS dimensions
Message-ID: <c4ce1bb36e2e02cca1ca240f88c817b28e7bf686.1794654074.git.daniel@makrotopia.org>
References: <cover.1794654074.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794654074.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_030956_039049_24C192D9 
X-CRM114-Status: GOOD (  11.57  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The VDPU346 control table registers the HEVC EXT_SPS_ST_RPS and
EXT_SPS_LT_RPS controls with 65 elements each. struct rkvdec_rps holds
64 short term sets and 32 long term references, the limits of ITU-T
H.265 7.4.8 and 7.4.3.2.1, and the VDPU346 shares that table with the
VDPU381.

Register the controls with 64 and 32 elements, the dimensions the
VDPU381 and VDPU383 use since commit f0b9d7e5be06 ("media: rkvdec:
hevc: tighten EXT SPS RPS control dimensions").

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 119564e33877d..ba61e373b4342 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -278,12 +278,12 @@ static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] = {
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
-		.cfg.dims = { 65 },
+		.cfg.dims = { 64 },
 	},
 	{
 		.cfg.id = V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
 		.cfg.ops = &rkvdec_ctrl_ops,
-		.cfg.dims = { 65 },
+		.cfg.dims = { 32 },
 	},
 };
 
-- 
2.56.0

