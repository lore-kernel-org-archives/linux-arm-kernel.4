Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7777C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uhPHuju4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lWAbZS8R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=; b=uhPHuju4uYdl79/JQhsC6496zZ
	+yq/L0x68Xk9yqEsJPuPm7zU8VHekXpG7DDz74+rYVi4jiaCoqBMq1eG5q1xbtGARrtWfNid2A9hv
	tFDEi4cj44NCk/5ZDQ4lbeMxdOARfAtSq+n7DpCORPjhDxDFOY9qYkqC5Nd17/iOq3h0ZSZMDPjCk
	i5c++Sf4OQ0RNUXZd6S6iwL82b4cRB3D/Y/f04mk3ijn7LOqI4aevdNYMarxq1VDLYHOKhavD9hsS
	FtRvpQQBbuEr2juHuAgSUp7daAeER03BPLuJ3+NIwN/iEIZw2DLh78xcoeNQDNiU4xl92TLUaJgz5
	g3qZybcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdlj-00000000Ew4-2RuJ;
	Sun, 15 Nov 2026 17:11:55 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSdlh-00000000Evj-3wvX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 17:11:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso14216795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762712; x=1795367512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
        b=lWAbZS8RzGOdAJEGJBP5nqHJt1exmVCERbwblLkhzIzxstP/ByPcYU7EWKknD9xIRI
         sIRYrvqaNQFfjS5OMPTFLtMewFqEyE6BL/ZTZzQg9WLn9cxh2yEWe/Z9XBW2g8IUjSey
         HmFOWblQQCgFccG04pMjX/5Uoebq8H5aq971tA4/mVC0EEHyi/wouGi6CPqLjIEosWTx
         7gJYfJEaDrjT/AX7twKp1Dso+hQkDrz5WMcNgFE8FvLDyQSp4V6Hng9NCr4f/Pef+MR0
         6it2PbDM81EdLXE3Fif9gN84Kjq6M9HtbOa1gRUYG60ECFvdnTD6DI/Cwmuev0Is+cPK
         3nBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dBdYXLHSNjF/d84cRLaI7Cq4Vv2L1S+rQoNIA2JWRWE=;
        b=qU8hC3ZexcOqPfYwL5zwwbHKNUYhhTx94/fS//Jmdlcb7EHUfmUZlE9EUNYBc3jN5Z
         nj6tkQ4FbdaNC8uWK7YUhjYSORzuXFjAFYtZ+ihP2Jvn0Gb7hSqSthrF+SOZ2ZulXd3q
         UZ7HxxRLoTTiKzegx5Gn0kBwBc7XuhrZ3XYJ4xlSXJPtCX9CHfcPAR01kkiXueNfzwf0
         ATf+mZgOJTfFqEeHwweNq70+5xQU81X4Pwo9zDFA69lBh2q5H5hFzDWo9FqfDNi/MYNJ
         KetgU845AC24J4KCHdXgKmo9ddIwwFGJqHCjeanACEZ8/72QvyYAmVTFZhRY0FEyM6IT
         jNZA==
X-Forwarded-Encrypted: i=1; AL+hErHvlXw8U+VxGuwlDjNvc0L7EFYIZaKjPS8urBTr9rWjYpE65vkkdEKZYHci6BJoGrNiTyLIJa6yhAnY9/eb7nvN@lists.infradead.org
X-Gm-Message-State: APuU4Z/+vKG/RW4E3/Gwr6Q7Uk/mmyEX4iv4wqFgOgsCQunssEm3fXwB
	FsSlDel6r20uR5PWR/bxxm0uQ75udCkZ/sWL3l3iiII56AdDw7GIAL0n
X-Gm-Gg: AYBFou02XQeeDeV7kjRsPlN5oLRgW/XdbuVShE2EHNwlSN2K5Q1PmHWIIJI1jP1m2qm
	Wap7Ot2bFYqvg7keUzDHiv1/M5X8jdikvh5lyPs0CmUlab0NxOAX4FRf6mHY/uMwPwKqhRDfoTa
	TJwSauxZZ1ywCq0HFVLsRjmz4lGolRJFzO/lgwT6sN08EZcNqZ3Nkn4L7SaZeSy2dBNwyEkWTvp
	wZ7MV+4hMgqMi4zwVxktVICeSfXIdr3+eodbkKQ/VOc8ufVTJ89Vle+bw56bo8eGFSkICZX3d/L
	+fvx+gM3uMAoh56k3n03Lt2n6Zm35z9DAsuWItVZLM9J1rWglRM+LThzR0cIsjuMfU9kkp21o47
	TyOukWCIXngTzcpRS8Vq14SpeSQVZl2ziTHnw99LZxe3zCoXO9ETqGvcx/tiCCDQOYJ3VM3CqTL
	S6vQ+ixmz3Eme4AwoGM3BHi1l8YKh+h0DrP3DlYsDUvdY2VOfSlDp7FuEkmTfotK8/FrxY1Pv+c
	s+NErTETK0D+7g1E2LYV7c9Q+tZtHl/eBw3mGQKUTskPcn5UQUhbWvYpovK7VI1ROsEMMnbehNg
	6mprTJco7Zh73dSUzPlhXrBI0fmxqrXlh1SPhjDsS5J4IRU+4aSUyRxEGBnPp7h8N5VFy83spWb
	2lmGZTdEvQG9GvvbOpUCs4FPE+HIT1MVHsEuAsKR+DQtg+rOt8W6sgaktG1D0jiFiB5GBhBitjp
	6iKrLAemRZRecIbikQLWfvv70os/vE7yUeIztAG6tbqe14dMhYOrArrJVvsMqJ4UhqNrjgDFOrA
	q3fDluleXMgzQ==
X-Received: by 2002:a05:600c:6994:b0:4bb:647d:dabe with SMTP id 5b1f17b1804b1-4bb647ddc1bmr101003735e9.3.1794762712078;
        Sun, 15 Nov 2026 09:11:52 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm501415845e9.1.2026.11.15.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:11:51 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Hilliard <james.hilliard1@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: h6: Enable Ethernet on Tanix TX6
Date: Sun, 15 Nov 2026 18:11:46 +0100
Message-ID: <20261115171148.37784-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_091153_996321_347EB90D 
X-CRM114-Status: GOOD (  10.03  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AC200 MFD and Ethernet PHY drivers and their bindings were merged
in v7.4-rc1. This series adds the device tree parts needed to use them
on H6, starting with the Tanix TX6 and TX6 mini TV boxes, whose only
Ethernet port goes through the PHY in the AC200 co-packaged with the
H6.

Patch 1 describes the AC200 in the H6 dtsi: the I2C3 controller with
the AC200 on it, a pwm-clock that provides its 24 MHz reference clock
from PWM1, the RMII pins and the EPHY calibration value in the SID.
Everything stays disabled.

Patch 2 enables Ethernet on the Tanix boards.

Tested on a Tanix TX6: 100 Mbit/s full duplex, about 11 MB/s in each
direction, and the link comes up both after cold boots with no
Ethernet initialisation in U-Boot and after U-Boot has used it. The
TX6 mini shares the same dtsi and was not tested separately.

The arm64 defconfig does not enable CONFIG_MFD_AC200 and
CONFIG_XPOWERS_ACX00_PHY yet; I can send a separate patch for that.

Best regards,
Jernej

Jernej Skrabec (2):
  arm64: dts: allwinner: sun50i-h6: Add AC200 companion chip
  arm64: dts: allwinner: tanix: Enable Ethernet

 .../boot/dts/allwinner/sun50i-h6-tanix.dtsi   | 40 ++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 53 +++++++++++++++++++
 2 files changed, 93 insertions(+)

-- 
2.43.0


