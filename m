Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDFD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yKVfg4lF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0I1njFRf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=; b=yKVfg4lFR+KRDz
	Km+zZoIpHBC/mAcKUXOdTa3YfY4RZCpb6df41YMrPRstlCryDa17riBGs2uKU6Z9nNIRu1yuS5z8o
	EHu9WBWBOL+DX9up5XdpFL4XawTjfV00J+OijQt6+/YrlAQkzFWxy85uoaAwYi5jw9NcOBjtxEOzl
	6yIKSpiu9oVqV/HJztX0hiGTmaE7DwCv+kVCMlRN2gwu0LneXiqYGCiRKpoe/tb8FYIcl9Jb6Q0gP
	FaLB0IBAVuQzgf47toG0/MYdjVAnQwynouyCmosaKKwRrlz4DdJ8AlJQHT1UyoUtziHH/Go75qXh1
	wx1CM+AnCN6jL1ilGZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoIh-00000006Hpy-2Kcr;
	Tue, 24 Nov 2026 11:03:03 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoId-00000006HpJ-2bEv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:03:02 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so1325007137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 03:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795518178; x=1796122978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
        b=0I1njFRfsk1ewwSaNYsplWQ6eY51BfCJemQGjy9Kihs/gmliXJdtZxB7Xr0iuVSH4v
         3LhjZTudL1OKQA8hdeqUxPTgOIJbkwAOXU3kvVbbwnhib7iik88Qh18Ns33xhAvHlCcX
         iz/5jysAvp0DIS0JJX82XULO37g/A/2VEeNBTR3ZAHlTD3sXebBVya5gMNv1bsZIIQ5j
         xkxZ9h1luQlTD4bvfzgWW4Px3BG0N499wbBGzBStWx7Iw4kXr5x1Y2+LPrnYW/gVhnpo
         BrvkS6VHwdQc1eiAKBb3x0XSw1NKsNq5iDRwOZrTbhukkPvl414lp5edmHyGMHS23EQ6
         dZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518178; x=1796122978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
        b=2FG5uFeczWOuj6b0IFywIIw5lq/xyH+JEHc8+PkuOGSO7XbTBLH6IL/lBRAH2bomP7
         U2GHz92VlSIv+JBp/bEWUtF4KCKy7srJk6joKdpnlHRqbDLs9lUH1jcqiFXNGCaBfwyE
         t9WKvqxbFLuZKR02pKNP1znkaQKs8MP4ePAau5itKKE4oZh2OdwohVJAqDpsoSL1etMA
         +tcazf6aXt8x9LXkCGdj0MXv+SFzui7tDaeZ9Z7xTM5ww4/Yg67KTDTyxmPPNHC/unzi
         dF/OBFlGmwpx6Lx4pUQQeLcsPL5kaj5fu57hwl7XsgzE/DBoEzY9PzZTTu9Y5UxJAyqQ
         z8oQ==
X-Forwarded-Encrypted: i=1; AL+hErGyXsIdCGH+0PKHnBEEk5uDFGzZwoLgbeCmj4rzUOuMj7Xvks+RNQK87vmf8ecqM8wY0cyEi5mgovh2QvlG7aIJ@lists.infradead.org
X-Gm-Message-State: APuU4Z8H12nOnRvRng1e9cUuLmN/LQ1i+b+KCklF/5DvFEAjggCFQKzp
	nYAHv2E0AItxp6JMsjj0seoq6CM953Zis0NJcf6RjC7JVIy5zR1l1mmn
X-Gm-Gg: AZFdTZe8g8h0rgpOXF/wSAH/frHAn/CDeG9AQ9qrCDNPuVePQNIR65e2QBVRHpx/GPU
	q9EQppF0eIr+/qnFWrdAJDK2GWIdTjqFsMxodyvs+CGfQK3B5N6H8Hxpr7AH/vTH5i6RUCYxyH0
	SSAUkSP89Xv/dUxHcnnu/ZyfR6/pKL39N18j8rmuN84qGrYK2prPJTduAu5fiK7k6Yov3z5H4ye
	S9FV3p3d/jRb6oNR5sRZiEg2eoKTYcIJK4sbZj0XZr+Gqvr3LoHgAgD4B1KpocezVYpkSrqZHyH
	iBx0sK22QvoRQP0z+bKfIgdxmLj+T2DMVaIJBcI/1YlIhLQD4R+WJbWRk+RjysAavudwlEn1X6l
	DEAdK1OOM3pTEKX2XMp1zQja5E4S/idVqvn8tyjuo15NB2gzzJgRRH+7h+umPLeQahRRNvtenfa
	Gb8TZ9jvitCz45kaddKt3DSdQ3pt6efOTl1sXkIzFeo5vcPHxq1pKHNNtU+vnwuM5lPrz7Y0gA0
	8xPhbViapV7LHCDpW57LhYxgxX9DIHvYrzSnIIR5dGaVnuiQByV3Uwe+sOlhfcPzj/jIR0GtXZS
	xDXgYJ9RSMoYw0suasV17DlGuAfRlCcr+eBcK36AH4DBvLmmMy9HbXdIxSnRY4yjrBj6Go5jadp
	kSvGjveKC92uzqTiBA5dk1UZC8iDcfyPCPeXNkDSetydN5Gwq
X-Received: by 2002:a05:6102:54a8:b0:7d6:56d3:f179 with SMTP id ada2fe7eead31-7d72b361a74mr6083753137.5.1795518177851;
        Tue, 24 Nov 2026 03:02:57 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:da53:c2d8:5b4f:38c1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8265e55sm14978477137.11.2026.11.24.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:02:57 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
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
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Tue, 24 Nov 2026 08:02:31 -0300
Message-ID: <20261124110231.15528-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_030259_704498_81A5726E 
X-CRM114-Status: UNSURE (   8.77  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z V1.11

I tested this dtsi with my A7Z board DT on a v7.4-rc1 lab kernel with
some of the posted dependencies and a local pinctrl fix, not the full
list from the cover letter.

All eight CPUs came up, both A55 and A76 PMUs registered, the PPI
partitions were recognized and sysfs shows one cluster. MMC0 ran at
3.3 V and 50 MHz, and a read of its first partition matched the
reference SHA-256. Two card-detect hotplug cycles worked with
GPIO_PULL_UP and the local EINT-mux fix.

I haven't tested the new I2C0 PG8/PG9 pins, PMU counting, EL2
interrupts, ITS/MSI or the A7S board DTS.

Thanks,
Vinicius

