Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B57F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3hTNUAIr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KPB3vq1Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=; b=3hTNUAIrknRIWr
	Ds2hp5Y1b+2BtzX1oU/VKiZEKoUwn5sEyK6/DNu5FTAdnO/GB48m1fS/B+FzdbKlnOQ61s9agPK9z
	E3a5jEfp7FqA2e3lqRkh0fSmgGZ7kVxHd9Vrh2O7hGlT9EmZXQq6XL4m7eqd1eBjaISMM/FuQYUHT
	uKvyoJMvms0d97smCaYtjotKDu6ktge15ishnTDRxGoPTo5FumXbS+DaajW6VyGBqNAUVnaIwPE+U
	EcIV3A51AZLwga/vE9zakuCyWqu8LaJ6k7Hy8wahvjpBloIt2Rg4T4NC0xhuHXnCb18afvD5s5wub
	QihwmPTWRYgq6NS9Fmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgAI-0000000ETFR-3bzc;
	Thu, 26 Nov 2026 20:33:58 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgA8-0000000ETCV-08LF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:33:49 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-86298f9267fso3857892a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725227; x=1796330027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
        b=KPB3vq1ZsT5buzEJA+i9FBfD1N8r6Vw8rgCHZl0zq2OyPiyw22S4hLltwozzrdM1GK
         eima/rPWD2Q+yt/Azx7k5joXdBUZvKy/EdaEpACzoJvaPkYizLsZi+J4vEm5zaDMmj6O
         ZFFrrEizoMa9/Dhsgnc4gB6d3kmbWe5gCyVP0vPMKpHm2cSC+84BJYw6LGRBdolKPOPu
         uTkYIupExTI7J03BW7b6we7Yl13NXNKaWWzh2zrP7+tO884pR5Btwlb6WUA100Qo3tKu
         kXWhqsGUsPRqVjly05RTHf4AVkDnCd+bNKCGlyR49Ziow/eWh5KOZcR6jg8jpLu9djo0
         IJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725227; x=1796330027;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPjhTscMvfM24X1rYGzlpf74+Z30vVLRif1XyUXWgAY=;
        b=c8ANq9ary6Lkp6yYByMUueH54GaoAxm9Dtj2nsvmMMQjTO1KS/1WGcDpTo3sAkjdpt
         pxx3WLrv37CzEzrzciGqUPIgkNfE91KzyrZqwCGJUU1GIoUtl7ZYhfuJ6TKWQ4eHc0+D
         MxttC2L9O2wc4Qx5U30BkOz+HWFDVanRpFvqt/8lJN9o0QeQouLfobg3+m9F91i0ye+V
         y/nSg++mIyfAo/iMTnRXfkqszhKx+0LjSBTWJ0Uzmo0q3fJ/3zsQJ4OFcKOOi4WhLF3S
         CTS/c/YhALh8OfYgXdON+DEUCpZ2gzmuqf5/ri5aG+J8l87EoBvR9FquMsh1E5g0k38a
         WaSw==
X-Forwarded-Encrypted: i=1; AL+hErEbuDbGZBuEQJb277BIIO8GMnkx3Z9kioeYvGJ6IK7r+zB+a3u9tunJz0YVcutEZLET2In+Ed+/yNscFe9vWF5k@lists.infradead.org
X-Gm-Message-State: APuU4Z8HyRPw438doOz+H5bvkG8bnEPTjUo/ic3bDcXH08UwPJX3svOG
	FRtvJCKMunoFLOLX6XdCbllzCnrG6rIXatJHT2WJsL9PTCSDFZkeOhn/
X-Gm-Gg: AZFdTZf7jW04CNzkcfiORih5O6lTQAkC+VGeu8AlbgGeZPx4bLyC/HZp6fPLBkz9nWQ
	hvcrh2ZqHY5Rir4puboRcOkuHuZtxABZ7tPsA83n6bR4GmzCWZ1H+jjoVYCc3TYo54m7zGjMVps
	hFKq+/TyXwjEn90ID+EdzaI8v3oobiFOsqj/QnPhPnoz+CJZ3tIH8gWBM+Lx79DgnWE2Wt4R/Mn
	jCZnTwLd688q2GeuZSvMtpfRkOK87WQpbap/MhvoQ0wU9tEhlEfTtjY7SQ83A3payLCgaqxNKes
	vH/wr6OYvFpSAKKaN22+ZoQ3JULMMUYaUJIQCqVkks4WI+xqOhgkVxFoVay69K/Z0V8thtBQO+J
	/DBnkbmWzleNh/Sa94VPNmVDmY7KzaTDjoqPESdN4z0hYoEeiw0lnHlWqd9Kt4OD9uZV576R0vq
	Gfd7grM/2H/Q9N8uCsJ6K3qeFnsN536Z+fEKCggPxQCK0+qywYjpotPdQjLxWxW8puQYTOnT3AE
	wqn3G3aNmWPfeOxS3Vj/YWULQj9z4GfCjYQN2vYrsKZo1vdPBfptkg4tsuj2PE7bfJD6TLMI6XU
	Dp/JGZcFL+1PpdVbZwnik+7lKMQ/ZsBA9MBFDYZvAtSBMioH+vuejGk9oEFemVv9Q7vNoljfVXy
	otF3uNw==
X-Received: by 2002:a05:6830:2696:b0:862:c9e8:5788 with SMTP id 46e09a7af769-86314febd1cmr24635150a34.0.1795725226996;
        Thu, 26 Nov 2026 12:33:46 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168c1bc5sm15139167a34.6.2026.11.26.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:33:46 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: alastair@d-silva.org,
	andre.przywara@arm.com,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 7/7] pinctrl: sunxi: add support for the Allwinner A733
Date: Thu, 26 Nov 2026 15:33:44 -0500
Message-ID: <20261125-a733-04-alastair-pinctrl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125115703.3724690-1-alastair@d-silva.org>
References: <20260910133519.459011-8-andre.przywara@arm.com> <20261125115703.3724690-1-alastair@d-silva.org>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123348_074386_D7C2F0C5 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>    Adding a 2-bit variant (writing 0b01 per bank with mask
>    0x3U << (2 * bank)) enables hardware auto-detect from PIO_POW_VAL
>    and fixes 3.3V RGMII TX (also addressed in Vinicius Pedrosa's
>    follow-up series).

Vinicius posted a separate two-patch series for the same issue [1] and
later marked it superseded by my v2 [2]. My v3 [3] sets every two-bit
voltage-mode field to auto (01) at init on both A733 controllers, as
documented in the A733 User Manual v1.00, sections 18.14.6.1 and
18.14.7.20. Vinicius tested v3 on a Cubie A7Z [4].

I've posted v4, rebased onto the EINT-mux fix in pinctrl fixes:
https://lore.kernel.org/r/20261125-a733-pinctrl-v4@gmail.com

Could you test v4 with RGMII on bank H on the Orange Pi 4 Pro?
I haven't tested it on that board. If it works, please reply to v4
with your Tested-by.

Pablo's IRQ-bank v3 resend covers the bank offset [5].

[1] https://lore.kernel.org/r/20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/20261106113425.28936-1-vinicius.eduardo.pedrosa@gmail.com
[3] https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com
[4] https://lore.kernel.org/r/20261111122013.35133-1-vinicius.eduardo.pedrosa@gmail.com
[5] https://lore.kernel.org/r/20261124215048.42074-1-pmazzini@gmail.com

Thanks,
Enzo

