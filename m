Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6274460A260A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ynCWglCq;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WEenCGxH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=; b=ynCWglCqJ0NVQJHkdHD3WjJ9cR
	BJSC8OpIggyM4tcrmgbatpUUqRBW6KVgmdChuSWKCqW8D1FomBvbEe4svpFBTDbVMZn5FH4S6YheX
	Kbo/AVQCc18UpWLf9HGkYLn1B5TWnizstTfmW8eCdH0QTDSqWwWNbbND285yx5Vwx3MbIyhHNEFas
	rMjJF6zAItHV2lTk25gjtCBl8noCgpb1ooEcZ6HsBI/jZlJipCl79k7H7YG/+TwGupHDMzcq/+CCz
	Lm5PGVepwYKXS0QANGeSTcMB2Ylnsft2oVIJ1DETBYTJ1NSJXA/BKew4oEyealXzupH/B+kjucink
	/aosOlfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThoG-00000009LnN-1GMK;
	Wed, 18 Nov 2026 15:42:56 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThoD-00000009Llr-3EPq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:42:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-49a92144733so519344f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795016570; x=1795621370; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
        b=WEenCGxHJN3gnwVNyxCZ1En0wOgNyz1SAcfgCdCCnKUdQsADOlzz6UOhPvrAz+ZGAv
         fUjFgxRd/svDqMkMdZbinpVLF9rzw9obj3i/ayzyfOMCEWxRrcOFOFbN3BNTHS+1ZzfM
         HIPnuF9JGoJF+imdYhGao7aT7A8UtTSZyYb/n963sQtnBSIR8zoVfNAH8ibpiU92HdUR
         /mdCB0WAynn51j2vaIUChGM1hpx9jbHIRGoV6JZT1EJisNMTsXkkYk1sBJE5ra/cun9p
         HmSAaYeYJeDNleFGIxJGmeFKAxcZvAyRxrVgSFokq35pquP/C34VDWyvMGri0A8mQeTb
         Hieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016570; x=1795621370;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AbKMYKWH3iewMgKAxFSkHDiwx9izCcaKX86SNu4jj0U=;
        b=CPUd+ATbp+NIbIMqoZWPy/KZUvTXvBYxmC78TAHR2VUyXDSFREIY6ebGuNVWXDsMUM
         CFRpkTL1arY1BvfLOTef21a2mmnJOBvvWac3+E70n4VnwrDFB4IGjTYZYS4DZxoZsg3+
         d3q0PmjOOYumXv/uDM///Y6rQ0CPEwjexVW/hjSKdSzrTGLc/taHam2SsShfAwLRXVqs
         Ws/cMRgh0gG3Rro4VImPWXfqH+M1tKsWjcsiMkksKp7Go4DCyGx8JcX4Ti5krWsqrSha
         58nWs3CRIxya6xlP1iUl55Fecul8Xtx+KtYgpwRZsRK3ijH2abkRKGapU8quFHMVImqH
         ExoQ==
X-Forwarded-Encrypted: i=1; AL+hErEkUmGgzAbLquaNAMoSy7unjVNkihBZ04Y220oIif0v2UnuPEbfkWpiErFPQqd9INmee9292y4R65rmTc+SP430@lists.infradead.org
X-Gm-Message-State: APuU4Z+LuZ9FwvuND9BTwBdhs551iLnct14ovLmXniNIxiym1MHcC+8N
	eW2KaMaVHa9tsSPda0aXJ0ZBPD1YPDTWApINYc31BkJzj5XzE+6OwJ87wX97pU25lYw=
X-Gm-Gg: AZFdTZdQ+DEC7pFDPLwfJa6i8fBHFaOI6JOT5ecXKJkLar95tIwSfFsnbhHaUiq/en8
	oYoHM1FzImzSTcORgEE2OeIt+lzFIrzHfHX0+IcTBtljfpuDR7ICA6lHPg7/S11CKSwn2oAZP+l
	hLqQnzScXhCjHvEJP4vTY6eTQstHd2kGJnKCfguv/p+KDfS64NNjcApX7RGN4e4dS6IVwlafsvh
	JN4deOdHWR664aJB4M/d6yNEkegfdJ+K37UOyJy/L7Pbym1RAP5nYlqCCtTgX85VsYSaQWTYNOh
	dhyP0MG1NtkL6qCiHFrm8HQNAP6b/O4RqAxX/hdlzSIAwfQSGNvw8Qx2RR0r8EMiE1Ws4Yg3AyA
	dZrQsEaU6NX1/b5jC/5226aovzZQxsJEO96bm2j7fbj86LC1aUvREQ/Ny/qKyKtSf6N9kO9MBmH
	qrIJHvvV7edbDoR5CwW65brcSAJuHHpmYO0EvZ1tH1qIRgek+78u03V+EYpcRnYV6TZJ0Cz8fWP
	lsSSIf0/zD2s30kh++N4JHcPIA6EkPfLvcTQ0UEmOFn7IBlD27FsoeSkqDaPcnHST/Ph/skD5Fq
	aYWeiThQo7rqHyZyAIrwrg3pYmsyp51L
X-Received: by 2002:a05:6000:220f:b0:4a7:8406:1e91 with SMTP id ffacd0b85a97d-4a7840621e8mr4063009f8f.30.1795016570528;
        Wed, 18 Nov 2026 07:42:50 -0800 (PST)
Received: from [10.42.0.1] ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5555261f8f.36.2026.11.18.07.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:42:50 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
Date: Wed, 18 Nov 2026 15:42:39 +0000
Subject: [PATCH] arm64: dts: allwinner: t527: orangepi-4a: Add PHY enable
 delay
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-opi4a-cldo4-ramp-delay-v1-1-9e3368973379@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwG4KuE/3mBZXQqvYr4ENpsBuZaWhBl7
 O6C3wG+A92aW0ekA83e3r3siCQDIT11X409IxKmcbqIyI1L9aCctlwCN31Vzrbpl8OsSZOYXMc
 ZA6E2W/zzj++P8/wBbu4jhWgAAAA=
X-Change-ID: 20261118-opi4a-cldo4-ramp-delay-45acac1e1705
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Daniel Drake <ddrake@baylibre.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_074253_833777_EB2B0B43 
X-CRM114-Status: GOOD (  11.50  )
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

The Motorcomm YT8531 Ethernet PHY on the Orange Pi 4A was not being
detected: its ID was reading back as zero and preventing ethernet from
working:

  dwmac-sun55i 4510000.ethernet eth0: cannot attach to PHY (error: -EINVAL)

Add an enable delay to the PHY supply regulator, as was done for the
same reason on the Radxa Cubie A5E in commit 7076938d20d2 ("arm64: dts:
allwinner: a527: cubie-a5e: Enable second Ethernet port").

This is also similar to the original vendor DTS which has this regulator
as always-on.

Fixes: a3606e8a7819 ("arm64: dts: allwinner: t527: orangepi-4a: Enable Ethernet port")
Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 26ce579b42bf..e1cd43ea7e03 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -319,6 +319,8 @@ reg_cldo4: cldo4 {
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-name = "vcc-3v3-phy1-lcd";
+				/* enough time for the PHY to fully power on */
+				regulator-enable-ramp-delay = <150000>;
 			};
 
 			reg_cpusldo: cpusldo {

---
base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
change-id: 20261118-opi4a-cldo4-ramp-delay-45acac1e1705

Best regards,
-- 
Daniel Drake <ddrake@baylibre.com>


