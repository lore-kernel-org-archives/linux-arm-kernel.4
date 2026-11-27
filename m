Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=42n4oLs7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CvWxJI8i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=; b=42n4oLs7pmEN4G
	SGcjD5GgYwyr+FnI/cSLgZpBrT1bBXoeaiiXrUHahqFyDsJYXTuyhkDb1K0u1DWNbIQ3VDZTNV9uE
	OqCU69vXyPKqGZVDoiIYHYt75COaiweu/bU/+ASraOsAehPECwkBSgL0PZNeLStqY1sEbELjPluBO
	5e4bOq0njrfn5bU+0uDEvPJowCuWuHmPEmaUk4PM7cmu6F8U2ifofs/ylj/6VYbQtPXPNSuHedS+R
	/R6puP2vyzdO1T7kAOKJhEh1npkPXUC3Fzy8Bu8I5k0nYWUnpEWKgUwYrPHVhGlFCX7LIXBFvw3rM
	r3kTkHePx71D0dCbd8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0M6-0000000HN2Y-3Oin;
	Fri, 27 Nov 2026 18:07:30 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0Lz-0000000HMyS-3i8F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:07:25 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-8479f46ecd8so3266601a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 10:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802843; x=1796407643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
        b=CvWxJI8ii4a8OuyLTqOUChiVxk4cbmeg0sm2i0PY18k6u3etmMSK2j+/ZWUW2UJJ+j
         iwKBOn4IFliLct8TpemojpJy318wqaplyr0GP8koQ+/GZ3AkoEJMu4rcFe8urv6exCtU
         Q81UGlrT58UKDxWqW8bQUkASqDxVG4AbXkIEE/dVaVk8h0F1Csr5+BjWwH9DsBUE2795
         IsH244xKWZb9zYIZu8BTbed4VfubrSzcLSDLU83E7eDA2/vPFsVW9t6x4mVXWuFCZDV2
         2WiHkgtwe/eBEVdj/n3TtvTW0Boeosq+0GZFkgzIF++Bmlv/KRpyLm3KOjN4KPL0tPQ2
         /csg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802843; x=1796407643;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O78vxOa7T7lspMRbm0NyNydhNPN5BQe1gN8vDW6zoPw=;
        b=BV5PHViDPVyGzGYv3wCptMfWyIWQKKK40NhtfuGJFPo5lRIIlUZ6hLpqASHMY7iXdg
         q98aEYTtVKZY7J5Jji4CPpygkmVvc6lCDh/IxT6j4HQV2qkpc4NgeZhf5aOv9k7+JIZj
         3XfMnZUKhPgYDXrTOzK/U33JM/Ru6EFAxc40w3YHaaq199W2WpBGcuGrBERSip6yggeF
         ykG04qFoxO9xpU9J5UY2U0XW/PazWBW3X24awdlyTBdjBHS4jprJXjDejObj1xR8UvkL
         9gcWMsPyJLM1bbJ+6ealwlmp1D/UHGykzYByADn4mx6w5pVTYXUcqgN5XLn2OcPIFcF2
         H4fQ==
X-Forwarded-Encrypted: i=1; AL+hErFTIJroAMcjyBMIlS1n7pQqqQg2Juo8qouOsTerhmha/EcdCsC6OrUOxN3SPRWb7czQYCIwXZIU9YwjO7zQxIOQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+vyTtgGRHiXe3Xx7gW8f0CRG8EdV4bWL17FnxtdvP1tYqrhAzQ
	7B08T8Wt2WWp+KxqLRQosObjUpbJnoaU+miXPW/fVrPRY3wpAbAdgDBy
X-Gm-Gg: AZFdTZeqZXwom1oufd4lUh9bTLHh7Azui4iw8zmWqxoPQwVkvIwccyDRMFCVQWJouob
	6DFhXzlJD3vatEAStzdYL4nO6sji2HpQ4MI0tZwRf4rnZ2e/NHZ4emuPsAqoCmyaeQXjHkCFPml
	oaMyBu6Cu8SXCx8csSyRFXp4XiubuI39tFcFhdwGp64NyXAS8QDa5z2nSE0Qnlv67nX2yg3Hngd
	PjaBH7IvLZE34gFVMUXu/E1xTO3vAtdTHg11K0kS8bh7MAsIOqExV0TcahT16HAik8hRQ5JsJVH
	YOq9bGy2ANr5aA+AGclnSedXy5lA0u+NrKuznyiGZtgz4nxJ6BY+LDjciEEJ4rVxLqCjZI+Noju
	67nAJkJPVxBLTrnjxKRNqAt4Nyjtd32KieBixu5GeHcu/25eGhMVClng6GGS3Cm7Anmrt0wXxr0
	SK3X+95uNRk/oyPNJi61CGc67iz9oMN3qtYoiYsUWQosrT3dx7ifIWV2QXNL7nwmzDBa9NE9Xgv
	0AEp1ZxSABGrcpyJGOiotxsPC2zHdDdP/vNEtMGmqlXQhMr/mNC6gpCvPh+5+OqZ+VKhOKYI4xb
	lnQ/xac23BYWIViJplNpw2NvksW2A30mmOc7gpgLc6yOnAJXfhw6EwAJ/KtokwVetjJK4QYwifS
	Ro/ZOmw==
X-Received: by 2002:a05:6830:438e:b0:814:8259:781e with SMTP id 46e09a7af769-863151bb271mr26675869a34.1.1795802842835;
        Fri, 27 Nov 2026 10:07:22 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86322db2d1asm16267566a34.4.2026.11.27.10.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:22 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: vinicius.eduardo.pedrosa@gmail.com
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>,
	Norman Herms <dockseed@proton.me>
Subject: Re: [PATCH v6 4/5] arm64: dts: allwinner: add Radxa Cubie A7Z board
Date: Fri, 27 Nov 2026 13:07:20 -0500
Message-ID: <20261127-a733-dt-v6-03-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-236169@kernel.org>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-4@gmail.com> <sashiko-outbox-236169@kernel.org>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_100723_929622_2E6F1F2C 
X-CRM114-Status: UNSURE (   9.15  )
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

> > +	vcc-pm-supply = <&reg_aldo1>;
> > +};
>
> [Severity: Low]
> Should vcc-pm-supply in &r_pio point to &reg_cldo1 instead of &reg_aldo1,
> or does reg_cldo1 have the wrong regulator-name?
>
> reg_cldo1 is a 1.8 V rail named "vcc-pm-lpddr" while reg_aldo1 is a 3.3 V
> rail named "vcc-pl-usb".

Vinicius, could you check VCC-PM on the A7Z schematic? &r_pio uses
reg_aldo1 for vcc-pm-supply, while cldo1 is named "vcc-pm-lpddr". I
will carry whichever fix you confirm in v7, with a note.

Also, is no-1-8-v on &mmc0 fine with you? It ties to Jernej's question
on 2/5 [1] and Andre's reply [2].

[1] https://lore.kernel.org/r/p3YaXlLJTguQBGnWyMpb1w@gmail.com
[2]
https://lore.kernel.org/r/9ab5f851-1b56-49ed-bfdd-46abdbdda1c0@arm.com

Enzo

