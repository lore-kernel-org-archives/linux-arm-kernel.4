Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F98606A890
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 13:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Sb3vijLl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oqkMqVnj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=; b=Sb3vijLlgW9thX8SoC4qM6pcTX
	Y0Ez3qrtEU14Mhq1EktjP9IgpT6+sXbl/qY8s7ULntRXESPkjeCUvfPC0yPpGswSWJFzbkuVieE6j
	mWZXE818vXbkXxHYr4rkhhKkdXKGQ55Q8AO3fMKAfOdoiiaOL8WnSr66gpIKdgdLx+R2fL7/lpkUs
	HhGW2P6SXMusoZ090yDghtiXlC7eOaikFZqprGbEUEh39FNuSD2JD8Qjrxp8GfockSh3wCWoQ/mwS
	avv6OAKdYI6khw6LCi/zHwEoGDKYGzFx2axl9X13ya1Ika3KCm0xlx/0oklugDtAuMe8Nj1+NSfiu
	LU3SHuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE0F-0000000G8kP-2i99;
	Sat, 14 Nov 2026 13:41:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSE0E-0000000G8jj-2vz8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 13:41:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DACE43A0E;
	Sat, 14 Nov 2026 13:41:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794663670;
	b=mMBaleVtJTcTOomBUm80y0FKHTwEBSxqtSHgL8bLuoPeipm4PWKFx/ov6ImbKGMgfgcj
	 Y+sfhre1GYep5P6iErSXLVIm4xY6E4/6CreW/vU3U2bj7rM+QFwOFJNm57nK4fPs552N/
	 nig7zK33vrMbFiWy3FBAnB1q1zysgAM4MtzBGVdczcX7ErVNFLmWsGs6jU6cElB1LA1Pi
	 XfT3O+5JYB+q8y/FVxFjI/ymFxx/AMlqd/Cu++sM4m8RjIkuBSf2cOGkhFsqDZYHGveB2
	 +JQ0teEi6sVw7SiZnYYRRCEQ/40mYDge3jpTuLj33jc1aAJZgh+plVyerCUqBgoHzSA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794663670;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=;
	b=Gvo4awAMpFd3s49/XGvhS2eY1wh1EMshBmP0tbhOiJ97Qwh5JPZJu9e0hv6fjHKyBwsY
	 urWmcJj5DrL8GDAMeAZHRUo+wHoBJRF/YbIw0S2atOFqwhO+o4E1lvViipTLd7rNp2TNe
	 BScRU05fpqESFOrF4+QzSN9hx5X5kozVvoowOl9Dsb+NBuUVQUKmnCMkXc/8Cq8/24Mon
	 xovN3X0ivB5U5wMe731p4Mx+p8CEcQ7qA0bqqQoutHPoatWJIe2e2VEoeXi2DfXzRgUCr
	 DMgCVw3omPLq1KeHHGQEjhSZJ3pm/Mxbzmkkm509XweE3eSGt7FLB7I2/NQ6dflDxtg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6F0A1F000C5;
	Sat, 14 Nov 2026 13:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794663670;
	bh=vxTe7UYstr5zmWrUwGezYJ045qR2VI9dQROuNPPuSTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=oqkMqVnj6H0oyQLn4Z0XZmf2UYI7j8/P3d1vU+GPksC0k665LvlcBWUe4dyyzcDk7
	 M/BFRSp66O7XCd5kn11sELfzKDQeunk2blZW3R2cQiCROxZaSeVYPu+eLxvLoHzIke
	 9/f2ey6XAgb5nMNwdmWJ7m9Dr0AeGSM5/CCQI0pWSParseCnxOKpyYea8tPxZ0nFs+
	 jgq+K6MPkbudPLTPQRJku8vD5ETkBUTdZe0Zp9Cxyjf4aNPPX9oVv1fGVDFeCmY0li
	 3IjeAmMPiAw4Rp4LdCA4bIaM+aAfarA4SGo9qigIHghxMy6MA+6zLTvPWkKTm7UpD9
	 tt8ld9phze5FQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F9BF49DB1;
	Sat, 14 Nov 2026 13:41:09 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 16:41:06 +0300
Subject: [PATCH v7 01/10] dt-bindings: vendor-prefixes: Add Securifi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-cs75xx-v7-1-8f17f38821b4@gmail.com>
References: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com>
In-Reply-To: <20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Drew Fustini <fustini@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 Jason Li <jason.li@cortina-access.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794663665; l=944;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=573roVKzdDYFuCfGNESYptLR9xpcGKVT07rDsXKZwOU=;
 b=osQRAw34EIeIqPaHCxOrvakpZLcesACv9TQr7r9bbOjSkVc9wpbxHd6F6OijkPShGTRUkpP1+
 35H+hXXg+TaD21ZSUkQL0Gll6BH6uxheQc0gtP7pucqDaXGDwJKtedg
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Securifi Ltd. makes the Almond series of touchscreen Wi-Fi routers.
Add a vendor prefix for it.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f9..f1f764ddb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1499,6 +1499,8 @@ patternProperties:
     description: SDMC Technology Co., Ltd
   "^seagate,.*":
     description: Seagate Technology PLC
+  "^securifi,.*":
+    description: Securifi Ltd.
   "^seeed,.*":
     description: Seeed Technology Co., Ltd
   "^seirobotics,.*":

-- 
2.53.0



