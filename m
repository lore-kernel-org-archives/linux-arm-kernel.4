Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B49D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 04:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c4jSPjqC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vUGZcc7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=; b=c4jSPjqCjorDZ36G4xYgUqeTW0
	FeOWzr6nFi1A4HZZfig1N3TEvzgsl63XlLDPpE/UdYalO01jWobdCJdMx/o3UztP9xnOCVRPWEQg2
	Z2GoAqJQDI8oIRka9+rLBD9yXWeEXuLQFejwknil4hQDHhKoWCzpiQF3cxEa/iyr6/DTz4im2reba
	vynh/CV5Zp4O2NO1bsSEVpZ4CWa5YVhKKamKLumTfHzlPiZVbzoiAD0Cu5gtBInU04nQv5mDXjQk0
	dn8IoYuwwd3U/XmMt7n+vHRZLPgipxkSZpD3ckp7N2lSc/rop9AdV2Whi7ecmcwUU+Ovw+Z2qeByB
	8Q1JpCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFn6-0000000E0Ee-3IYN;
	Fri, 20 Nov 2026 04:00:00 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFn1-0000000E0Dn-0SNd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:59:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2f01f296937so3491245ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795147194; x=1795751994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=;
        b=vUGZcc7sbBCAoPCLDChxD0BSK6+svq9B9E1Z4QXlrtWSr/O+24dsYRlMr8lHEpImCd
         bDYRmf07JMvmtlKv+GP8q+JIksknr6zgMCO0vtuDpH/MYPKqfHCmabsr8yoX7hmCyc5H
         nESC1d8MT7iwGYc8TgixXu/0Vh/JkAG7heuEPC4Ob8oVNecFoqyIFrZMJzJZYMwmT/54
         W91tU3KzhCMhGrRtNOsJcWJhsYWD/MQLGv0ull7JHScPgm+PFnVfVQ8AkyJTqL1a0nEk
         xM6c7yc41Sv2fxqCecow3qr3RHcKW7sPvtr8GMQLEVpD0g3G+g4P7qgj2SAIl7uOQ2JU
         atHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795147194; x=1795751994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0m0WrqZYBcRighyEzQXIZqHlbBArN5NZqU2y6idkHc4=;
        b=k3O5JcXyrPZ+VZRsEqP/WSLPXMeQMLhl9Kl4f4Z9M8gSOXy7zTOV9NW0UJdF/iG8OZ
         Cdf8GnXHwnEy2oCkRPG/VZ8ssUwGVN4PokioXMIhrwEsQNqfPEblJMnUZuE6eUYSZDjY
         BTt78MpkmwTjVPHIFcF9/anVai5gqjTg+O5MdfJo6Jq2VEB49tOw+gjyJ9e3nXibghWI
         HVjSKvY0ghv86/dBRUxZVXUTuN9SAvpknJ8048oW9fEgdaDs+Qj+utaz/d/1EHmwJOCD
         FI8M6Yb9yRKe+SGt1XK6ik0/K3+fmicnDoh0MQxm3K5czKZooI1XqgQBOPBm9uh8Vsux
         oxKg==
X-Forwarded-Encrypted: i=1; AL+hErFwZfojVETOHM9cpgD6tsKhKYgd7jc0rvl5jvKj7yPkCB2dzZwbDaoW9hnO2O+eaq76zs/beX1wA3332hn5H5wf@lists.infradead.org
X-Gm-Message-State: APuU4Z/bzTo8fRwHjHAZFesuyox+X7IxOgZusjdGQrpb2ulB8bSywPWI
	SRxT5kMOihep+vMMaz9URwRek9D5Sj16PbKVgJqyPp+BmyuM7zcb6f5b
X-Gm-Gg: AZFdTZdG0n5sb0BzY21Ea9x3MEGEenSuBJrFqyQ5GRhwAjuBToj/59b3W6X87gTAKrb
	xkCgit37ZgIquG6B2fCbYB2eyj0f7c6mQrthirX4rbyQxkaHvolBbiUXeUFBupBjdi7CIJO++YI
	8kYvIy203lj463ODhYUVP6ZncaEmVdF4uqC4bkJSBUxTbjp8ie/f1Mpyl9zgJ+SwPM3UOGcZYpf
	Boiit/0L7el3BWYRjIhu2id+Q2dP7S48FQyQg/UeKKoXlaOkfzk3emE0ap+/a/JpDRDNNaLyK7g
	OWbwsVcrdmw1HkYAMYKCJqDGiqUNkt95XGPXkQDWj+rtKVYcefmegSH2phLUjCJSr7SLjR0vQcG
	/QUw8xdmZtmXCVrZZlJjdIDTBnqhVodRb5qfyMCNQHr4tA5o33B+y9/x6nx07eMstaRN4qzlrNO
	wBbL1jv4UGmLkdyeobdhY7AGz+kUMO1VxKVl0GRXEKa3TqnxiIsr2ub7JiMfd59CS8QOjnXBidn
	HvY2B5k1KtM9YE5Dd0DZwP1C1RcjmcT/KNt/8Ty4CTVQ0IOMy1pCG3jTSYXcjfZIMLeGdrT4QgZ
	gpHuf42orpfFmB6iFxyJiIWo1lisUKeS1g02zvwb1L6e27n1Wu2aC7EWZ9W8FtjvDDuthwzwBnr
	mg+AGFokkNr4orqzAdo/+/2DeekDWv5qlRslFPsDYiBlv
X-Received: by 2002:a17:902:ecc2:b0:2ef:ee39:5dbb with SMTP id d9443c01a7336-2f03f2b52f4mr19751355ad.61.1795147193940;
        Thu, 19 Nov 2026 19:59:53 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm7801115ad.63.2026.11.19.19.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:59:53 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 0/2] ASoC: atmel: mchp-spdifrx: Fix format handling and MR configuration
Date: Fri, 20 Nov 2026 10:59:37 +0700
Message-ID: <20261120035939.12774-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_195955_207332_6FF8F752 
X-CRM114-Status: GOOD (  13.65  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series addresses two issues in the mchp-spdifrx driver: inconsistent 
handling of the 16-bit big-endian format and MR register updates 
in hw_params().

This series was developed on top of the previous series:
https://lore.kernel.org/all/20261119103413.31729-1-phucduc.bui@gmail.com/

Since this is an RFC series, I have kept it separate rather than including 
these changes in the previous series. The previous series should be 
applied first to avoid conflicts when applying these patches.

The changes are not hardware-tested, and I would appreciate feedback from 
someone with access to the hardware.

In particular, the MR register change needs verification. If the current 
code works as expected, the existing full-register write in hw_params() 
may be intentional, and the actual issue could instead be the default 
configuration in dai_probe().

For the 16-bit big-endian format, the current format check is clearly 
inconsistent with MCHP_SPDIF_FORMATS. However, it is also possible that 
the advertised format should be corrected instead of changing the check 
in hw_params(). Furthermore, I could not find datasheet documentation 
confirming support for big-endian 16-bit and 20-bit formats.

Therefore, hardware testing is needed to determine whether these changes 
are correct.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (2):
  ASoC: atmel: mchp-spdifrx: Fix 16-bit big-endian format check
  ASoC: atmel: mchp-spdifrx: Preserve MR defaults in hw_params

 sound/soc/atmel/mchp-spdifrx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.43.0


