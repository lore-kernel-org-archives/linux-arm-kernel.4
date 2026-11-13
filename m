Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE9C606DE9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3aqQnnR;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nWscyXs/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g2qaIraqGb6bN4owT1f1HtprvKALrE5RBwqNGOqQx4w=; b=R3aqQnnREaQaOk
	THnwoVVH6L7A1s24rDMDxrodLSxJmS2u7zd0yWZKi/RSgaF5y6FejANC1togGEWoh9qayU4JY9sN5
	tPldUOcnCDlMZtRCjcirCM9IUtzxXqLhS5WodaZ0fzdUfg7GNg4U8DMw0Yt/xhfnTb4nTPTVko2pl
	TXwI2a3FQGqO0etakf/TETo+4fItQ8FzXZJtPLw7jgdaNFxRwAlyTtofp5EIHjR73c76+aHYRcfCQ
	6YU51pC6ZLXoBEcJGDjOHeecigBm1j55/sruC9iQuypHHYoCnzEalwAtVb4a8Mz/sFzERQQ+ExlXA
	f2Fyu6Ueny48AUGppdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHl-0000000BL8a-1wgd;
	Fri, 13 Nov 2026 00:36:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfHg-0000000BL79-2kVM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:36:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so5588825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530211; x=1795135011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2qaIraqGb6bN4owT1f1HtprvKALrE5RBwqNGOqQx4w=;
        b=nWscyXs/c67FEUAluZ45aDA/K7TM945tHN5ECY4PY9vWU8DEaQsBuyDEBJo+klIjSy
         97BSUAy0iWYQJn9sCpHugdoks5N4NScoFS7pa7Ag28uqtVPycPbDVwkzM2KGCWJmdrzw
         6LpKn8wdKmsH1aYpRV9Mp6cJd5Lp2HI79OgLAAiljOYUSBJ7cP0qLQrd5YMUh8Zq1Xv1
         P1jgdBPWkI359s12qTHSdk13Dawmer/KhwhAwwx5Q2Oua9Te/1mZxUE60gcKKlz2cz0E
         J+o2wJTxMwvnVKvn+cO+FcNQLtDiRWeDj6znmsuMn+hMJnV9fymUBewsuvat7l6Nd+dS
         28rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530211; x=1795135011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g2qaIraqGb6bN4owT1f1HtprvKALrE5RBwqNGOqQx4w=;
        b=ARsZ2bGpRHl4Q7xLv3c+JB2qnq3FCh+XkqFsI4eUDC922GqBE+YvAzeNyufd5KlWWn
         86wsmpIYbHaI/ItWetpYBoMoXH6eKFeP9b2+zE5pcPxPjZp5U94Fmy6C8dHD/RP87UD9
         dpbm/y5GoNGuWju6oRI7fDjRXi0zP0kGVecNRzSGHSyFHNj08MyFoV8vazdS6btwR35H
         kYJog8f0tG8E1ONUvFnqOxXXB4B+odQsKVh4q6cfdYkn1jzrLFJRJRZ+7b3bGXC2ri+8
         a4Tj1aw6UNQ2Q2VLiVp9IN7R/V+h/zdknWm9qrjBV0JNE3A/EXNEUdIYmhY3BaJey5He
         FwFg==
X-Forwarded-Encrypted: i=1; AL+hErGUupwK/P4WGa8sfr6KUVXhaoFdIJl7vYjCaIvGJTdQ8nO2vNt11KSRau+ds9piwgH+uoUq8+2DBxuk6J1vj59s@lists.infradead.org
X-Gm-Message-State: APuU4Z9UyZjouAvXDk6i0taOC2lRgdL4/ElTu4bpGrt8HlP4Kaq+NYQ8
	Oli3M8KUTUrh+3cW4/s4KwGiGWB6pDY0fi+TXJh12fCzpdGjcOvocN9L
X-Gm-Gg: AYBFou0JcHFWi+V/9aiMWSdG3zGIT0CDYgurdqQ72VDwrK9m6dxDF3J1b06Vh5pYwpZ
	2Vm4Q6T90XyxGOIp584PJ1VqT3QUW0RGmUjUMZ+mQFpH/cTDy4wlKZd8e405uzlxMaYs09rJZRH
	2lNKBt3pbDSEG9W7duQG1OuHWwrqulGV67WFKLtjD6cCmDQlmHhQfX+T3uTsFSxu9BEN9IvZS5N
	ooPR+TGeHZipaf9Vbjqw1y2pIgyHc0VuO6dkizNlN5zu3SV4MOoqeRj1FGV689idep66hHwj5RQ
	Hl1Np9P1ZAZyoU1SOl9tDtL9gbWyrwEQZaLd61NHlJyEdPnYr89BBNQrrv+fcG8DphuAnfyqvCo
	Ex0cxInlBymqmjQdND1EUlZGSXPK4WgvDvJIl6ROo2Y6+cgLn3XI3rJI8g9jR9ggxVe86Gnx9RB
	T/OvflBboBaeqkmDUunCfVGt6UhaRLaBenXzPg8xzV0WPlXi68xYmq3Hlnvy9sYZVF903m46zxM
	wv9O3gM+Xa1F+zmvTn3Z2XPcZYEh8n8cYYfUo2+2caEJJpbWck1jN5MHsN91NxPH4tbOtn2yjy8
	B50wphRzqwYBiYIb38B9T/uBl6A8yCbEI4Tqb7nAeuW5nYArg7pYZDdAq0qPDaELLBg/AKUPV6n
	lufknznc6PIDf7UfVxG3fhjivUsU1tbo50+avz90wyU8raAlyDBpBlOZ4nlbcl42vQazVR+NkKR
	yrSsOfyO+8fqJL5gAu
X-Received: by 2002:a05:600c:8b11:b0:4a3:59c9:a756 with SMTP id 5b1f17b1804b1-4bb55a6a53emr19068665e9.6.1794530210742;
        Thu, 12 Nov 2026 16:36:50 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f2c40sm3737035e9.2.2026.11.12.16.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:49 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE ZXHN H3600
Date: Fri, 13 Nov 2026 00:36:48 +0000
Message-ID: <20261113003648.3665061-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <9dde103c-354c-4fd5-84fc-cd6555df59d1@lunn.ch>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com> <Lurh_NpYS2qId-6ONmcWzg@gmail.com> <20261014071955.1755637-1-ghahramani.navid@gmail.com> <9dde103c-354c-4fd5-84fc-cd6555df59d1@lunn.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163652_704886_C10270D5 
X-CRM114-Status: GOOD (  14.54  )
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

Hi Andrew,

Andrew Lunn wrote:
> You are going to need to split this patch series up by
> subsystem. Please send all the networking patches to netdev.

I will. The next version will only be the base support, so platform,
clocks, resets and the device tree, for linux-arm-kernel. The MDIO, PHY
and switch patches will go to netdev as their own series following
maintainer-netdev.rst.

> This is the sort of project i like to see, somebody with real hardware
> in there hands learning about how the kernel works, rather than the
> usual bombardment of AI generated patches.

Thank you. I am not hiding that I use AI tools. They help me speed
things up, learn what a part does and help with the reverse engineering.
But I am a hands on engineer too. I review the code they produce and
rework it, I sit on the UART myself and I test everything properly on
the hardware. It will take me some time to get to the level of the Linux
community though, since I am coming back to C after a long break.

Best regards,
Navid

