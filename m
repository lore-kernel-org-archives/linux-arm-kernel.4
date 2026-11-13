Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D345C606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 21:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q3NoFp5F;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YmEd6Xyy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=; b=Q3NoFp5FVgGPbD
	slG48Gt6KFbum9SuZ71URBZ3f3nqRbYvVnNjFhT1TtjTkciSltTmhhbMZpwTOBW+TtDkv8HiKLVtI
	dt1YKiKCtRYHdpT/MC2zUyoKn/FPwkoFdqKpDr6J4fuFrBPb5Psli+7Np/q/mkvHixw/eFMGQsw/r
	r9rC6tVuo/LKHETqXWpywQCLYCD0qurgpovqWzFUEJl5N1r5XwDFYRWR6jLG69rZnpYc3GHw+2M/e
	rlOYNvk0gIljKVVo28N6hkAuBX0v5SIzXFP4ocmOLojaMNgNsqRgVXjTEnx45fTPnmfPA7GvVg9iP
	3/IgfM/7x8ewCnnOpS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyXD-0000000EXtx-1AQH;
	Fri, 13 Nov 2026 21:10:11 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyWm-0000000EXca-48PA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 21:09:46 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1438d9363fbso775365c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 13:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604184; x=1795208984; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=YmEd6XyyptbaYsExdWBclNay/FJuhRGdHqFilPncH9n+2h2AqVlNK76Ed5oUPg9n5d
         8V6myJZiC2j1VpT0vmfjapcu/nDyftsbr29h8Ujdi7REsxJMpt6CBVN4wyM1nwo94ADB
         bPsbLtOaomkjtCNuUKyfVPg4lmtc+tTG1Un9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604184; x=1795208984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEhCbhJxhFZz5+IkdVTZLQBzFG+PYKljMqg0fOSE0pw=;
        b=qgwxZNSEUBjMdTRlwi3TJZVT0nnTT+HTJa83KN1MfTxIE/0l/Zlq3jxuulkNuLp9wd
         +0fjS43itrIm6yfJNLcrvEV+PFy82SPaMPQl7NmNkxx5LMXMNffhd1X5k7j7GKPy4Opx
         a5IlaLEGInPaO9rMDB8bsermrlklI0ozIvzREXBmX4piEzpEYwvKZS7NaQMbxolC8Uej
         rzusKtMbAYdK91dunlFfEYoodd0pDU03n9ScycuKR+s4EElfMknGknNHekbeGXDIuGCl
         qU8J8K4PcrOHZBnyIib09XvVQJlCFOia4VJGTYoASHVaVuDQorPxwQYGHU96jQFGIyy2
         DQyw==
X-Forwarded-Encrypted: i=1; AL+hErHmuDuehFiMcxQrcH+sOGvivbg2Ck/HaOJXTaSxXnEX5vDA+bWWeoYM8YZkfy4FjV2+afrAQ/5cOfQUFrICsShn@lists.infradead.org
X-Gm-Message-State: APuU4Z+Z5NOXWq8f5I6qaEAIhDeTsP9CFE5dkIPwDPnoLAO9ac1jtGTv
	UdXYyWOmpogpvigegDGX3f9t/mE2lQl/FjA1syCT3wwF8Ed3eEDAVpKeCUSDelWBtw==
X-Gm-Gg: AYBFou1A00kYckIK4RGli/KBoP8OGlUExvl41K/MYJwvrgLc+6PiV0TvG+SJ2wLlm0t
	gpNvagp7elVQUhp6yfPzjACPYvKoR+zP3fyibdRhKfjZ20H7i+/sWgDFd7f/f8FSJTn8ACUYVZk
	LYBF9emCa3EWCqRDoufZYPraosSc9OvwrmsuQ9ajV8VnNjlEkfKCpNKUFDrDNQ14ghlgiujFAVd
	7pRH1H+kIYvwrkDTfqqjyquD+0vBJxYLv4NAGyiUZMWqwzNphUicx1JcTylvnP+o2GJoP4Imvek
	TnQZG2/9JdHfj/WFn/oHl/Na7k7kYwfduRTX7N8zHe3jwA+YymbRI7uoD+5ckEA7n0gMW6twoJA
	+QVdqPUMpfF+NCnCE5Qebe0YD+15cN0Cnc5TTi/hmiM5VoSXce3u198iALey5NRSeI8BmrAw+4C
	l1j0K6teMV7n6C7znrM/KvGeOu12kFQDC1W8E67uJHM0XncKMth++L1N3zyQvVGdVJL6yQ/AUGB
	ij0Uf43uE+BGRiwG9qMr2rYIxM6Cg6aaMsgcedEEWiFhBjnSY+wdO9dgjB3lKf7dux8s7Qpp9zy
	1LdsSU3dDRoPya0isHyhqKqNwKboIBb3T7PZXoS3NJF5oV896wkT7492YEaX4N5yLlT8ul6E2Cd
	1gJq3BiP0ImvS2PhirU/zvkST6kJwtBtKKA==
X-Received: by 2002:a05:7022:4093:b0:1b3:b455:93c3 with SMTP id a92af1059eb24-1b5030cf269mr3095118c88.22.1794604181056;
        Fri, 13 Nov 2026 13:09:41 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:40 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH v2 4/5] arm64: dts: google: lga: Add lga.fitconfig FIT configuration file
Date: Fri, 13 Nov 2026 13:09:13 -0800
Message-ID: <20261113130858.RFC.v2.4.Idfb669fd6c518bc86e45d8555f159c0ec611a6f9@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_130945_040819_47CDA534 
X-CRM114-Status: GOOD (  16.74  )
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
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a FIT configuration file (`lga.fitconfig`) listing the Google Tensor
G5 (LGA) Pixel 10 family boards (`lga-blazer.dtb`, `lga-frankel.dtb`,
and `lga-mustang.dtb`) along with board and SoC ID/revision metadata in
each configuration's `match-1` subnode [1], allowing the LGA FIT image
to be built with:

  make \
    FIT_CONFIG=google/lga.fitconfig \
    FIT_COMPRESSION=none \
    FIT_FACTOR_DTBS=1 \
    FDTFACTOR_ARGS="--strip-local-fixups --single-base-dtb" \
    image.fit

NOTE: At the moment, Pixel 10 doesn't directly boot from a FIT
image. However, packaging scripts will be able to take an image as
built above and convert it into a format that the bootloader can
handle.

Each configuration carries a `match-1` subnode (`compatible =
"google,board-id"`) with typed `board-id`, `board-rev`, `soc-id`, and
`soc-rev` properties [1] to identify which configuration to use on which
board without polluting the device trees themselves with loader
metadata. Having a structured (and upstream) place to store this data is
part of the motivation for landing this FIT configuration file.

Side note: at the moment, the Pixel bootloader can't handle picking
overlays based on the `soc-id` and `soc-rev` (it only uses those to pick
base dtb files), so for now we won't be able to support boards that
might have different SoCs. I've included the `soc-id` and `soc-rev` in
this FIT configuration in the hopes that we can improve the bootloader
in the future, though.

[1] https://github.com/open-source-firmware/flat-image-tree/pull/66

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Replace checked-in lga.its with a compact lga.fitconfig sidecar file
  consumed by scripts/make_fit.py (Simon Glass)
- Move board/SoC matching metadata from the configuration description
  string to a typed match-1 subnode per the proposed FIT spec extension
  (Simon Glass)

 arch/arm64/boot/dts/google/lga.fitconfig | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 arch/arm64/boot/dts/google/lga.fitconfig

diff --git a/arch/arm64/boot/dts/google/lga.fitconfig b/arch/arm64/boot/dts/google/lga.fitconfig
new file mode 100644
index 000000000000..fd90b85c2fb6
--- /dev/null
+++ b/arch/arm64/boot/dts/google/lga.fitconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+
+[lga-blazer.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070406
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-frankel.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070306
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
+
+[lga-mustang.dtb]
+match-1/compatible = google,board-id
+match-1/board-id = 0x070506
+match-1/board-rev = 0x010000
+match-1/soc-id = 0x0005
+match-1/soc-rev = 0x010000
-- 
2.56.0.611.g1030f0b940-goog


