Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E2E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ToaSDgJ2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K/8lxWGE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=; b=ToaSDgJ20Lle8p
	YjH5Lbfia0xA32xHWTSRIU8sQdBooNRvTEg9T/EsUd09xOWS3OjWZ+ahR65HoynLrSdO4czYwypJ5
	2Ck6QlGntP/AruPNL+uwT8Z9kFVbFD0PNGrGTvSMWUqDyCeISN/Mvni0ADis/9qQ08EFCAim7GOGS
	T3KWbTR6zOO30kAbkjLSNAp5vzlzGxTDaebaOfZtR2Y2jxRjbzRuVWML8/WIN0LDwnjfcdIBUlzJY
	pLv8gDmidH3rSVWIP5YezLeh17yMKt2fMVV1/DS2TKCKFVweUL1rCFDyORJF2H0dBmjzgR8jXug19
	DQ8kMSs22wRe275iW8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0MI-0000000HN91-0Akr;
	Fri, 27 Nov 2026 18:07:42 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX0MB-0000000HN59-40yy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 18:07:39 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-7190d9bdb2cso5007728eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 10:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795802855; x=1796407655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
        b=K/8lxWGEqB4E5xUqYY4Ihj5Bz77mv6imWVfungVE/hFT/Mrz4LdDBfAqWwiuifRzAW
         OULHpw/xdq7XIUf1Hzh1OGYTwjRCN2wpBz/6iePfnkrvEM7r8Eoyb2/GSKET2CDeS600
         Ox9xHPm4IE0ZmjDBd8b6knrQZ3nGPPZUOct2mYQ4s+Off7XusHfV71wgj7sbgfonDA2M
         ijgMRORlTaUwu+5FLFcCDw74lkNvMyW/8I697lmCC2/tSL5b7ewCyUR30BiaM4A9DZjH
         rD+GD3cigNO/0Oxc5FM3AJ6rh+oia1RZQK/Xov/jDGzjnm5JREoS6Yxou73D2ztOb+2e
         znIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795802855; x=1796407655;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+jIPjNvYn3h9h+TJTZMShL4W1q3aCeTVBe375LBwnw=;
        b=26mMEs2QWKahMGiYIgz1an0bcFWuX54go8fCeqWeCLRz1T1pKmzs5uhW0KeKxa4j0S
         HQhs0yG/0YXt3SR/shGqRZIvl/GAYr+Mkgj6Igj2u02tLnFPJFEtgdA/qUNaEFPYUSeg
         EUEjyPBpEgyZ6AeoW+1VIGHeImE0tOyVLntpki+1aoGkx+tjpB8HqSQ2TS0ZTIU5xaJN
         zEU9HFO+8M2H2ZuiLvM1sz5gV562nhGSeW8SU8CPBDaJGLg+9Va00KiI4jalarUpDXwm
         O4BPseW6+kP14PXEUs63Km0nPbI7qCi/tKnj8vsfIDiNWCOKIouGJyq5vnQGiNDjh2J8
         3QhA==
X-Forwarded-Encrypted: i=1; AL+hErHFQnqugzbbz93H/L31YJdkyvz5LTeXs5nlP2QeDWuuvxzORrkOXU1q3+XZ8tSmc/MsEDjDMST8RVVL/jlLU3CZ@lists.infradead.org
X-Gm-Message-State: APuU4Z/HVWNgf5oDzqxlpfLj/KARVD428AfLGI1cJpNZHHo49pzarqI2
	7/vUamI8nQvKLah6BImNWRDWFi7L4CkhUOHatWmMK6d211KMwgS2HSR2
X-Gm-Gg: AZFdTZeNa1GZPyIh4EvFzSNbRwM72DrGm5VTnZn9UciGdBGn5fNJX1oQfWXEpjryRhm
	NqH7TIuz/PdcZpC89QBGlEwMQNat87/fmdHIt+X5UjWloyT9N1Eu8lv9EsY98y3qb8yMJb7qJeU
	Mje2QgWyZADGHPLbZghKruLe8qa2ZewYIJrFrxD2Vvp7RktE+91QmaVjNPJwLzqKdUiwUIsedKC
	LII9NQTawdLLDrvTnr5+Lj/wuGXAT4WYOxsZYKc9yiQ+0ZShpvmYf11dYYwhe0gvAFdilFYexCr
	8Mwqi/UwQ8AfmqvN1mb1+IPWXosEVBxvfJUrjA6VVO7pkn9LNgrUikdepgKqE9WA2kUXAxHZY4J
	k7cLsybK7+7g51Wxofe/NuK5mITheeJvItjteIinrFCIp2/kzi3JHKMzLfoQ5v4DS4lpWyAsJ1a
	cW2qhDV2x8Z/6+u5PjjMCWSyGX5Cwnvg6GVO0cwJ/al1kkBXNvsr8ddxwW+p97L8MJNb3325k2w
	prhhN2O/YOTOn5bHPvCtIPOASremgUeQtO6mw2JQ5Y3LqAUohclnfMs0FFEUG4EhiRYc4PIlnsV
	akE1knDk41rLqj05R0UBbJ8SMzrTyTBolZJ4mTeAHQlgvmIrnudvL2OwvJVvqEryRpIKMDbbEVP
	oMa/gQAN+t02NJJa126G07tccTXk=
X-Received: by 2002:a05:6820:3410:20b0:717:da:ba40 with SMTP id 006d021491bc7-71b394956cdmr13815414eaf.26.1795802854800;
        Fri, 27 Nov 2026 10:07:34 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c46sm16618767eaf.4.2026.11.27.10.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:07:34 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: dockseed@proton.me
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
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Date: Fri, 27 Nov 2026 13:07:32 -0500
Message-ID: <20261127-a733-dt-v6-05-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <z51JFKDjnRGxR5v8f-2sigY7Ih39S9_hQJF-C7-0jwRzGvAZcyniqmAsBFOyj_Vci0JDoXGMbuWcop6uSGRMUon5bqjJFMIjMk9jN8TbaLU=@proton.me>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_100736_001964_95415329 
X-CRM114-Status: GOOD (  11.39  )
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

> The cover lists CPU/cache topology as untested: all eight CPUs are in
> one cluster, as described. Patch 2/5 mentions the shared L3, but the
> DTSI has no cache nodes, so the kernel falls back to reporting L2 as
> shared by all eight CPUs as well (index2 shared_cpu_list 0-7).

Right. v7 rewords 2/5 so it no longer claims the shared L3 is
described.

> The EEPROM probes as writable. It holds Radxa's factory data, and
> our own DT reads the MAC address from it at 0x9e, so read-only might be
> worth considering.

Agreed, v7 marks it read-only.

> Card hotplug, listed as untested in the cover, works with Vinicius'
> "do not switch the mux to read IRQ lines" fix (a256b8c8083e) on top:
> pulling the card gives "card removed" and reinserting it gives "new
> high speed SDXC card". Without that fix the PF6 level follows the card,
> but the card detect interrupt never fires, so the A7S needs it for
> hotplug.

v7's cover letter names Vinicius' "pinctrl: sunxi: a733: do not switch
the mux to read IRQ lines" as needed for card-detect interrupts on the
A7S.

Enzo

