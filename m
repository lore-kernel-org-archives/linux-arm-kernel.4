Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FB8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qxKRhdEb;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LUvBQ7bb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=; b=qxKRhdEbI6Ptv7
	auo0yEWawAlMgrRzY2dHjwRk+B1gXkaKCp+0wfGwhd78YadoNQ73KfvLXvqAVqMnEZzDxZ38hYXIE
	WEUhQCHEgYgQt5l203nnrY5oE2m7mUjU2qfqbR+JqOyU8N7Box650gUljfUAZuXw+APSurzZ2GeZU
	xrVhRQIbpzYIIa4/D7ByAnqEzpAE9eKTfa5rsxoz2DUIHqxzRSq7k2m+g+Tqr/pGOPSs4Dz6DdOej
	HZaKQWEo7dQqQGbL7HpDX1BgFJzqigWQA2tit+weqttcVqcuCsj4jp+ZsVVfV0CDwlTpbe4OeE9O4
	fi34EcQk9TNpzAK5V8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS1v-000000036QQ-3CTu;
	Mon, 23 Nov 2026 11:16:15 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS1s-000000036Pr-3pdQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:16:14 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso1123114e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432571; x=1796037371; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
        b=LUvBQ7bbz9gYwFhtNb9OvonIVvHJnQsZMmLkWuXZLruTXq1Vnb98TmmGMwQIwW9zSB
         Sdh0/CBY6PJ48iGHEkF5qQskPJL6B58jpSjdTc58xIhfrYcE30CqBgl/t8R+y6WUgVHV
         AUBbKLhUeA1a5Q8QL7z8Qo959Q4DEaFPeT3O8nQ+/QofcKV1qmG1xWJJy6CjIMp692tQ
         8KjhqlRSeh2A1jqNkfnypKmo59A0KT1U8+r0AsJzqE7WA8aWsqrgJD4h+V30BucYg3aU
         EQyyf8VF39E11IJEnMqVxURi0HXk+pb5E+3JwHe6U/6Amrcxuibq5CRD0J6PnbRSCjIr
         2WSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432571; x=1796037371;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wHEXuOSq8IB0JemVzpCJR/4WrOKlizJ3OUREG2wJ9Qk=;
        b=C/ClePT5lMuazk7vH+qLN1ZElsK80TsPMrhyG0Tw24onc3/mIVFr8yPjhShIdawsOJ
         SsCGyLTb9XrNHzyhH/7sTVyZzSJCi3PbqftzH56+/eyYqOfHK4r6hGlnWWNr2qjPgTbB
         /ayoXd9vQAUUEjjB8TteXZgFVtBTM/ABZiz8ng0ogGN3W9vQmueR5/7SiKpS0zyF5tzy
         xdD2GQyyNiyxrt9GzefX8BWrIU75lcOxvtcv7a/b1x5kBbp5njV5KCgkatmFNHj3zRt+
         Wu3BI1v1hpFsHaLsEszMWNc2QeRu0CTrw/3joJdyczp/Ca7WxU5O3Px3yxFo8/NiwpyC
         zwXQ==
X-Forwarded-Encrypted: i=1; AL+hErGpvEENzzGKDeZS8SIHhMZ5soNaHnfjUCfuGgZ4TCF1zXlytciW4qRD/P4oH9OqdQqPrxU32hMZet8DkpPXeQwm@lists.infradead.org
X-Gm-Message-State: APuU4Z8vT7wUSZKf2avAavgjGjkR37P+hGOzNjPBPludmQByqYdBqT/p
	TNVfSNTmQSmFpfKgcV96nUh9bLFdIJraB7K4COZ5wihlhEYL3biSg1WKRyCBxN08N3c=
X-Gm-Gg: AZFdTZemX52raUJ/5kF+/0/i6BJd7BP7H5FdZ3SrdmtnBz38Xs4MtORkdOVe0OTUrwC
	Hj9dzUAgifjCvDWyDRfQIc7XbCKIDjSCdKzmjcIPMH/EIqUorIf2Ccp69G7zJqDgd40IVIsNznh
	nN3Qt+jT6IBq96kJ0lWZgIxka9ARMVtLJaE04wHFBOytgFLaIO5AS1QKjBICWs4UZfbeMinUpZX
	MwJHwR+SRlja8BI31cbRJ9GVMMX7U4MNU4x+WA6m6Ecc9XVmAPcxnW1xa0cqoXk3M8t5ru2hS2U
	Qcjp0sDmbnjE5QTpi0x1VAXVagcJPTmr7AJXMvcF/l3qTrBblh/qNb8iCHjThT5pj+iKMcvLSd7
	9xnH89RKiJAOcA/4/KV86r3nv4ELyS/g7nRaQfyUQIdDICY3HEojIx/+r21efiycAvyf8PSaKdx
	PRCy8+wGRtHwiLTfvu0txNOw+XUw8drMrTV2qJXCyIaPlkS0YgvnwWQZpaXtZyhHqL0+NtdZ5us
	AaVLDmVvftq5vehrjGP5ML1SAtuV5JFH+dkQ1z/zkycEDYX+/fRWmHmO/CsBHb+Y7yVZ2MEJtFp
	4e5mZ7GS9yCBj8lc0bSo2ez+BBMcL0f8yc2wPMiV0TdTuZO6ZBeUXOhgAY25vM03zUCD5F4FdCY
	Z0aSeKc+Gz+8Zx1XcrFrP/HtWajACVifRHhZVbceZWRFxQk0eo6yubriBnL8=
X-Received: by 2002:a05:6122:288a:b0:5c9:c60e:3a40 with SMTP id 71dfb90a1353d-5ee8af56a83mr5616946e0c.18.1795432570921;
        Mon, 23 Nov 2026 03:16:10 -0800 (PST)
Received: from MaquinaLab.. ([2804:1b2:aa42:30d0:88c6:e1ab:a806:9c3d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b4335e1sm10485066e0c.1.2026.11.23.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:16:10 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: allwinner: add Radxa Cubie A7Z support
Date: Mon, 23 Nov 2026 08:15:47 -0300
Message-ID: <20261123111547.24280-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
References: <20261111134919.90264-1-vinicius.eduardo.pedrosa@gmail.com> <CAGb2v66nKWdF3AvXDfb07iYVQE5FC5yDkhuutShp+Z-EgFXEfg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031612_964543_5058EF29 
X-CRM114-Status: GOOD (  13.48  )
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

On Sat, Nov 21, 2026 at 12:14 AM Chen-Yu Tsai <wens@kernel.org> wrote:
> There seem to be 3 revisions of A7Z. Which one are you targeting? Or are
> there no differences as far as the OS is concerned?

I'm targeting V1.11, which is the board I have and tested.

I compared the published schematics. V1.10 differs from V1.11 in two
places relevant to this DT:

On V1.10, BLDOIN comes from SWOUT2 and CLDOIN from PS. V1.11 uses a
separate SY8089 step-down regulator at 2.4 V for both.

V1.11 adds a 10k external pull-up (R59) to the microSD card-detect line,
which V1.10 doesn't have.

So the power supplies and card-detect configuration would need changes
for V1.10.

From the V2.00 schematic, the parts covered by this DT (PMIC, microSD,
LED and UART) appear unchanged from V1.11. V2.00 adds MIPI DSI, a second
CSI connector and a backlight driver, none of which are described here.

Would you prefer keeping this DT for V1.11 (and V2.00), with a separate
DT for V1.10 if needed, or splitting the revision-specific parts now?

I also saw Andre's review of Enzo's v4 [1]. I'll apply the relevant
changes to this DT, including removing the MMC alias and revisiting the
regulator descriptions and constraints. I'll wait for Enzo's v5, test on
my V1.11 board and send a v2 with those changes and the LED patch
squashed into the board DT, as Krzysztof requested.

[1] https://lore.kernel.org/all/20261122003932.568c099c@ryzen.lan/

Thanks,
Vinicius

