Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F3606A88A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gWd2oHEa;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aLgAE2F1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a9+SF6U2AiWoeGlLfeemvFEwWPJkSucImk3rldu64e4=; b=gWd2oHEaocjtkj
	424U9qTuCK5+NZTYugq0H+AzLGGAx0zi9D4hy1OVOTM9OeXLqCLgUFuc6HfUAGrh4T97aI/khUyNC
	aiMJSANgo5oPiJQBr640vIih1Mc681FX2Y4gEhsJL/nGdv1Vup1nUDaL4945efdy/13IfyYqMjPRn
	hS8/Lxmx5fegy+OXdVyOeuI3cu1CvexzYsT5oOKSWWUMCcuZuq1hNRsyi120srTUcu+OMGB9FWuwU
	EviaDe/blzspn+xdRvvNlvdMnZDcamSkYAP0dGfHOj0HPrhQ9zEOEpfNc4MgC/6PMcAgUWMl4+kGJ
	JC3/WretbUYOw8IPZGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4V2-0000000FHZw-1vc8;
	Sat, 14 Nov 2026 03:32:20 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Uz-0000000FHYn-0vBC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:32:18 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3b1d1d74384so43910a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627136; x=1795231936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9+SF6U2AiWoeGlLfeemvFEwWPJkSucImk3rldu64e4=;
        b=dGTzYt3Ms6XT/RZ7BpgWe6DOYdhVnSN9vsqzPdICjfqDUbg6iPyX1O/aatbOcatfDf
         D6W0ay4IeMoPe88n+AmRNwbr5pmtqt3mWDVTgPGgy78Zr2cn4pVY+qtG9OE66IwtCSdH
         EcKha6MCfxy5hJJfMbegw+yj3Nywc5R1XrJFXPbFEVxKblZR/o1X+sGDsEPU6b0IjqPu
         gRVB2EXww35e7gyIZGnBudM1v7uo+IuKHapc4Rn2CzbhlPrq99y2kRj8t6h8TY0FjkwK
         ndLrYFIABcEc2vz+RWRBZDU/ZgqiOazSNp2Zog3icQDGGPN9PhpLPptMWSOQtxzTF5l5
         LhAQ==
X-Forwarded-Encrypted: i=1; AL+hErGHS+2CT79LNIjLheOWnAgQWABo6ZbFzPbfjYJiAj0L0XKC22Fb1hj68GJ9yCIBYgJOervxKokypJ+nmNyjPnr8@lists.infradead.org
X-Gm-Message-State: APuU4Z+8z9P8YeiAjhMZIa+xtH22pNKiKx0RI9waKOd0Taj0RVbt+rlk
	R1AeczLpi2oRwZo/CqbTZ11aVemdK6RZDJzXf10d+x3CrULWpJuxLux2cqgOa5ZrjOrN41W8XTq
	CQBLHy+B+XmqD/ikscMkQSULOsc77/Ea0GruwnHMsnB0lgiYEOxKyQWmx8iOSo4wY3nwTPynHs9
	TO0qs95gMAOkHYCqyU3YKfkhwUYOsvz06KS29EOwpDagiks2xO/vUApCTbQHMwBVQwjjIHYypuC
	4LTf67ZAh46NYZtLDRqxhq7hJz8xPx/VaA=
X-Gm-Gg: AYBFou0C4BPXVjyoC4qUDCTqv7Ey4YsGTeV5ahblMj//19fsCHJpf7u4NowlsQa8c2I
	2VlAYZ2qwfrlwkbB6bgVWOeoYuJcXKTmW2En8oWJ3FtpAiyt6UPKK5/XNWoxp5Ybg9/PMmxDaDF
	yg4V6T1Jrzp3Yv644uv5zJA84JXqdwq5YoOGsGplnUOt82fNIWI44a/zGHVBvbmGGaCA/SFxzG1
	VpLnvPWaeOm5IYHp8h7hYu0U91tcohuEclLL9yjzfn3dCC66azyYwTdjHV7rfMlAWXUP4nSywlL
	6/cFCa/7gM3zWOrNeAfKJ1RNrqfBESrPpN4XGkywE43aNaeI7GqBGLHrkI7orjwyc2BFqv7JFeR
	cDuL0AQfHRfE+724fzTMoNZiiqGnZS6R7iHrG5COlIR4fiB6Q1DovTK32gHJ1pzZ+IVXE7R2+7Q
	72c/o3n53DwYlvmmMwvQtNivrvLhYZPNeqrPDwIK8m
X-Received: by 2002:a17:90b:4f86:b0:3b0:9b3c:4434 with SMTP id 98e67ed59e1d1-3b1b0ca50f0mr4126470a91.36.1794627136260;
        Fri, 13 Nov 2026 19:32:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197cdc76asm9127703a91.7.2026.11.13.19.32.14
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:32:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso7016865eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627133; x=1795231933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9+SF6U2AiWoeGlLfeemvFEwWPJkSucImk3rldu64e4=;
        b=aLgAE2F1dYPTx3RCRPG8kxk1twmzNMm84hIyDTTCtLIaMH4mGLVQZfU5WJrxBELy21
         bFgO3kywbsj3l1/QLHsisiFu/gGnuY+MjbKSxeNQx7bfq1gTj8JpAwlO0vw3bV/usbDS
         EvJBSDCPszzWXqSzSNBe1+iu5NQbZFiHit7Ds=
X-Forwarded-Encrypted: i=1; AL+hErEEtUjYablRn9xpULZBsWFn7ub0GKU7frodE69Z1PImnWLW8dg4pL0w9tUIoMYU20CrsuWx1aibRmJwTq979ZwJ@lists.infradead.org
X-Received: by 2002:a05:693c:414d:10b0:377:678:2309 with SMTP id 5a478bee46e88-37966a58effmr4496555eec.15.1794627133231;
        Fri, 13 Nov 2026 19:32:13 -0800 (PST)
X-Received: by 2002:a05:693c:414d:10b0:377:678:2309 with SMTP id 5a478bee46e88-37966a58effmr4496527eec.15.1794627132576;
        Fri, 13 Nov 2026 19:32:12 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm12851389eec.28.2026.11.13.19.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:32:12 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Tomasz Unger <tomasz.unger@yahoo.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/raspberrypi: vchiq: Fix kernel-doc Return section
Date: Fri, 13 Nov 2026 19:32:10 -0800
Message-ID: <20261114033210.876038-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac@yahoo.pl>
References: <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac.ref@yahoo.pl> <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac@yahoo.pl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_193217_261420_630C6DDE 
X-CRM114-Status: GOOD (  10.80  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Tue, 10 Nov 2026 22:38:25 +0100, Tomasz Unger <tomasz.unger@yahoo.pl> wrote:
> scripts/kernel-doc -Wall reports that vchiq_register_chrdev() has no
> description of its return value:
> 
>   Warning: drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:1341
>   No description found for return value of 'vchiq_register_chrdev'
> 
> The comment does describe it, but in a free-form "Returns 0 on success
> ..." sentence that kernel-doc does not recognize. Convert it to a
> "Return:" section.
> 
> No functional change.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

