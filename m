Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11720606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z4zgof6i;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sj0GHNsH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=; b=z4zgof6i6oHxAA7cbnJ3oPjLC9
	k2zLtNhz+Mo6Qfm8ENx9ek2kuf8fgP4WF4eiJJTKVhk1j6+A5jPmEufvvGF29S1sO+U8iuv8fbPGK
	hfo4hevI4rB93wAW4znm2PfcqYW5gu8vkNxbzE0X6hjy6b7WwX10Ok/N4q8NrTdj9H2K/7YIFa7VT
	m25x715FXjUKAqQkQkeA524WAzm6++yuwYjTy2r0aoiu30yVtzHiUK5Hr15yT65udhupeo2Aubf/K
	v7UhDAS6viVSBlkH6QJ+MU/py3noiawN2A4sBMKO8lmlzuMCeN21Gp5SNcy6jNqDQiZGGKoySkVFu
	6BZPBBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlGO-0000000EkeF-0UI0;
	Fri, 27 Nov 2026 02:00:36 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlGL-0000000Ekdd-0Hzb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:00:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4bb61185057so48790695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795744831; x=1796349631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
        b=sj0GHNsH53VxVhC1Jug8XQbggkKW4BvLOK+EzzTaz3KjYnrYOa/bmUyVyaszON+ir3
         qGVB3aGezZ+RDZTLWG8jJRVrNQlgEZdeI4L1TPH4tdok58pHxtd2E31kK+t47tzYtlRl
         Y1GBGQCCwUQWjTCXpQQ26oVGGeSdYBadBTzwJY5AxguykGWvnwBoD2OWjpDVf6+VweYf
         DioHX7IxVPRacdjQtrMwzPHmLTIEnig/m3BdjiBuidi3zf4Yf5AmGBYnVSEWxGtlAVxS
         JiUcfEMSDTKiNj6GmAbywHnFARIm24KG06uoFW4YZEBnC/l3fLgEe388+FpxdypTp9Vm
         Aq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795744831; x=1796349631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8cYAKlybvKZI73hh1wvp6MwPtr/imx6o3ak22xMEUk=;
        b=kfRklzyAqTGklPfWTFEyOU2Ch6BgW/GRuMbGdbKqqpc3pB5GmaNEdAWRFAHTJMOPxw
         Yi7rIc0VCs/zyHcDpmyqOMQZbnxHDfXJxSKclv2petCiWVMNN1au5lHEZQMxdqHVIHeA
         RClFboi3PPfvLLd6HAK2ZDxEBBmOVwiiC9JKwbqUQRSuszFLjKC5IQmCnR0AAmUSjLbl
         ckMqzy1VqATQGluOL3JNWdQFGiQgbxUwTrFBN1JyVyE/sq4MBuZb2NTMP9GFcsbhx4fn
         Jn2JgtX6DHNJxf/Hxd86VatmDYfnxDOIHfHtQi0kWHpNlb3KP/iJrUkRdooxXt0O+eOw
         koSA==
X-Forwarded-Encrypted: i=1; AL+hErG2U56WYniXfQTrbqxqeZcnP5XBKo8tql98NQcM4SPu9yX4naOCs1th7vWl3aCNVvQb1AcV8c0TTt9jqL3rS3E6@lists.infradead.org
X-Gm-Message-State: APuU4Z9bpCqMYOLBbkdE2yFGy9l95vIeGLJ9Wxbql7682LpcVvP8u2x4
	eEVimb6P56SszGfyLn3+a63BJZs3xbqFsRYWLNBCH3fF1s9Sc8UHsHrD
X-Gm-Gg: AZFdTZcowcFL3nxYu72TwuLCl/6iWSl3Fz6jGe+G/ejLv06/35kQuYhzJHvH8tZOr32
	jDxhQXeI22WlkpFCrs/J/GiOWxWGDS+6W8uLuO5Dmjaw1ciKmjeyuFWBQTtcNkFOgDP0e5GYnP2
	12tXxOcgUjv7hg9lm6XOw0knJf+dBgkTRCap9DV/OdVZn4/rAq9+oIXFfBNVBpOpopTxDVa7rt7
	MKgGFHhL9JZxboxfH39Y+HSuDLZ0S5eHSI1W0pq1mvyxTN1C4Zk/rpTFsxnP7KSlO3X+GaQdq0Q
	TjKWxGN7PxvrwRYgNouYHs0oBliW/us4+v5x3GW6XeLGPG/6bn74iKHrwA2TNlWea9Gj3uTfsLz
	9YUC7x+QDW6UacH6sTyvIs0tRPxcT6YCBQfFvQhhthZgajrgh2YRynhiqzI43OYF5RMjuq9WwRJ
	tZsIka775K1ZD8KfJayzNv0Xytp/5zvuTsHnEDhTlzWUfz5xx6q/D6fOIT96br8uhFVBSgMeqRE
	4R9kI4RFVqifh1lVyvigg8F0MvacDFccf41EBDPkB9keoj0hixacx3fhTJlorUm/SSQVie05xxE
	B2bL+fzSO6Ue8Lj8w3GTJQ3KSFNxJQqb5DtGZgZMd23W8rME8HTHvM9NGQwJf0hTSG2J5v10GWy
	aPY4u6FGWn1jwhb3phkhGhN4aShl7hRRFQ3oPb/ohms4OhQ==
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr468130625e9.16.1795744831000;
        Thu, 26 Nov 2026 18:00:31 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm44994364f8f.2.2026.11.26.18.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:00:30 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2] ASoC: sun8i-codec-analog: Add the headphone inversion switches
Date: Fri, 27 Nov 2026 03:00:29 +0100
Message-ID: <20261127020029.1618525-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_180033_378718_6BE671EB 
X-CRM114-Status: GOOD (  17.11  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
are "Left HPOUT Negative To Right HPOUT Mute" and "Right HPOUT Negative
To Left HPOUT Mute" in the A23 and A33 user manuals and the V3s
datasheet (0 = mute, the reset value). The driver defines them, but
nothing can set them.

The PocketGo S30 (A33) has a mono speaker amplifier bridged across HPL
and HPR. With the same signal on both outputs it gets very little;
setting bit 1 makes it clearly louder, which is what the board needs.

Expose each bit as its own switch, "Headphone L to R Inversion Playback
Switch" and "Headphone R to L Inversion Playback Switch". Both default
to off (the reset value), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Changes in v2:
- Two independent switches instead of one enum that kept both bits from
  being set together (Mark Brown). With both bits set the S30 speaker
  goes silent (results below), which does no harm, so there is no reason
  to forbid it in the driver.
- Commit message: describe the bits by their manual names and what the
  S30 needs, without a signal model I cannot back up.
- Link to v1: https://lore.kernel.org/r/20261103133935.2892210-1-romain.tisserand@gmail.com

Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, and =y in the A33 kernel
  below, no warnings. On a PocketGo S30 (A33, mono speaker amplifier bridged
  across HPL and HPR) on 7.3.1, stereo path (AIF1 DA0 "Stereo", headphone
  source DAC), 440 Hz tone on both channels, listening to the speaker:
  both switches off (PAEN_HP_CTRL 0xf4): quiet; "L to R" on (0xf6):
  clearly louder; both on (0xf7): silent apart from a few clicks. (The
  test kernel had longer control names, which ALSA truncated; this
  version only shortens them.)
  Before this version, the same bits written by hand while playing, with
  a second tone on the left channel only:

    bits 1:0     both channels    left channel only
    00           normal           normal
    10           louder           silent
    01           loud             loud
    11           silent           silent

- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..e24fd7bd0613 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -323,6 +323,13 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	/* inverted left to the right output, and the reverse */
+	SOC_SINGLE("Headphone L to R Inversion Playback Switch",
+		   SUN8I_ADDA_PAEN_HP_CTRL,
+		   SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE, 1, 0),
+	SOC_SINGLE("Headphone R to L Inversion Playback Switch",
+		   SUN8I_ADDA_PAEN_HP_CTRL,
+		   SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE, 1, 0),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: 9f961caa18fc4678067232f8f021a23cb1588de4
-- 
2.43.0


