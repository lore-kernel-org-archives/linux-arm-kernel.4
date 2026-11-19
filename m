Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA014606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 09:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qi1fXiHX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jX0bqgSn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BfuQOTrbBgGM1H6IV66t9dZSuCArSgWVXq1IwDlbWkM=; b=Qi1fXiHX09aq1q5Z7t8Az4hS3t
	UM7SOsVS/251c1yoC0RF928Rh1wird85m08w9j4nmtX2AcU/7VyVjIYe7bZYEEGOulcfv8H5ma0bR
	eaZaP9bjqtF87v03CnJ1feaf/RH5Eiynam7F/faOZpKMXN6Yz4MQqMB1DUeSPFXX5YP9ESH79XxH8
	KcifEv7DV+Vr6YuYqg+KGHyNFFOj7TvsYqVxerQc4jMGbFHP3Fk2ZG3w3foGcOF1tVn6yGUVSYJjW
	RiiAufbyHUaS8NECmerxSqcb+jzi4N8jshyixnF1LxaojciDMeTORaAM1tcPZ/97Azh74sBlCzSaA
	FNaz8Www==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyXm-0000000BPP3-2vIG;
	Thu, 19 Nov 2026 09:35:02 +0000
Received: from mail-ej2-x09.google.com ([2a00:1450:4864:34::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTyXj-0000000BPOB-2nvI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 09:35:01 +0000
Received: by mail-ej2-x09.google.com with SMTP id a640c23a62f3a-c504a17a455so62264366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 01:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795080897; x=1795685697; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfuQOTrbBgGM1H6IV66t9dZSuCArSgWVXq1IwDlbWkM=;
        b=jX0bqgSnEXhGJUCPjlV7EehIfUUCchz78H5edaUvp7zdy1HIpMFMPZWJ9+jB8Ra7Hr
         HLCaqMP/KQAq3k1FtmDIeknFjDXra8eyCbVKDJ/Dr3QU3UEDqFaWx1LRK+NhCuVy67Fq
         ifQZ8Hdk6WALCNSrzmy2iz7JwX+4uwqgdV8bQNM8z7kwu3D0n6uA8/YNH+BzwARX1Fkf
         NtdadbmddebSL0kpMmlSI0KSoV57CJ2LdQ9LSX1YGes0GsHgn3vt/k6W29RXr00rmTpd
         bPHzX4c5fJZlvvUG9PhU2t/nwuLSNqnld6aaZLQtXrVw2yBuUz7+RbZeHP9LouDDu8Sc
         vGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080897; x=1795685697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BfuQOTrbBgGM1H6IV66t9dZSuCArSgWVXq1IwDlbWkM=;
        b=BjRSgI5gjFZMppTvZmQ/iTOuuu/9fetyGVZa+B0RxAnmnpGDzM3bVX+w97eWZevqJK
         Rx4wTbjATWurWItKIgIwTCfMnHRW2QeenHK4GxemuoTHQnXg4bOOWw3q9hYY+h1qr+M7
         1J4bAo59Eor0H/JH7Ylcp6S0DwBM5oOYIlPXGaxZlYZmAXPbs8LFDaRgSbvBZfVvEt3u
         g48D8Feg5GW2mmVFBEvRuLiGfPQdH4YRPeeO0P40/U+NHhwG6xxRoC7F8TASYxyfzn+d
         DxH2EQDRzjMcnTG4M8VjGx8deH82Qfv/tlpSInD34g33tvwvVAUtGesv4RixSsSH3DEr
         c7pw==
X-Forwarded-Encrypted: i=1; AL+hErFxLnIPndTRoYGSEJUKSpiT+2X76G6Glpj/U4gAib+a/WL/v/cH6vWlX4b2x1dMKWYCaGGISjX/L1i5TooEv6qM@lists.infradead.org
X-Gm-Message-State: APuU4Z+bYkYgJ5SmJirF1em2tdu0Y431Lf21UJtv2EUaIzai31vDeGHC
	ex4ovyduP3btCBN/h2SFLZfnIcVrTi4TS4r8A2jlIBblXUMBrTolBsoc
X-Gm-Gg: AYBFou1HjndWszCPslGX1QKRBOUcpTAwUbgDDcCUa9ESFlVOOfyqdGmKMC7i9kDMHEZ
	aNQ7btyZXbjMMdzbA2tjNZ5dXitMlWHJ/JqZabX9T5TVhB0C0Brs6dZ67eLumnV2tGe69gdj7nO
	OfNW+CqqxUaD/e4q5PFh3LtKTmj5+tZY7+H65cMn1lKqhLvtXsNwZhWTIJOKxG7lm9SyQJsZl6s
	7p09VPiqDTx/YEYz1EnxFYqI/iedGWLtY9V208IvI2Vb0/6XMNVxbsZoQB7EPSdKdrqUHKa+diw
	pVjlv9gGYqjnKDouKzqJ7XIRMR69JcJrvadFfZ7s8yiJGONL7UReOuMIPsFLR5xVxorOHRhhwVt
	eUl4ES/n15hOc/Bjnmv00EH8TJrfmtiPLhtHg33OKeRL7htnkIUhtyo5JD0sipagAdOo0Ey0BPa
	Ag4Meemiw4o6yQJ2uXA0NrNYB9k9r97xiBlREwV2UwB++Tak0FWp/gn+vSvsi6DwVL+1jlx8m2S
	Z372x9kvfqpXTtfcxxiOpsNi8UeyoKKUQL0FYKyQcRm9nbL5ObIoOIx7mxa0gX8/TnE8qhrWwFQ
	FVUsXndDOR91YmkEQKDvBWINexhKJ3loB7KXH9xRP7tTEGo6N8fFdN7flZzPVKxeLZ1nPy7pDtx
	UMqN+1nqR7Lq30IQmsbrIv79pK73ciR1SG8Vds7AXkFuCuNZqpuRO8qtf
X-Received: by 2002:a17:907:6d13:b0:c3f:7e8:235d with SMTP id a640c23a62f3a-c510dec35a4mr480605066b.5.1795080897118;
        Thu, 19 Nov 2026 01:34:57 -0800 (PST)
Received: from thi-server.fritz.box (dslb-092-076-089-226.092.076.pools.vodafone-ip.de. [92.76.89.226])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5122e68675sm93767366b.0.2026.11.19.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:34:56 -0800 (PST)
Date: Thu, 19 Nov 2026 10:34:54 +0100
From: Thilo Zirnstein <thi.zirnstein@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Subject: Re: [PATCH v4 1/2] i2c: i2c-xiic: fix clearing of bnb irq
Message-ID: <av7CvgS20rBjsJHx@thi-server.fritz.box>
References: <20261118101147.3350796-1-thi.zirnstein@gmail.com>
 <20261118101147.3350796-2-thi.zirnstein@gmail.com>
 <av2jSyTFI1VoyGSU@zenone.zhora.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <av2jSyTFI1VoyGSU@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013459_726269_F9A3475C 
X-CRM114-Status: GOOD (  16.88  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 02:22:18PM +0100, Andi Shyti wrote:

Hi Andi, 

Thank you for your review and feedback

> Hi Thilo,
> 
> ...
> 
> > +	ret = read_poll_timeout_atomic(xiic_getreg8, sr,
> > +			sr & XIIC_SR_BUS_BUSY_MASK, 0, XIIC_BB_TIMEOUT_US, 0,
> > +			i2c, XIIC_SR_REG_OFFSET);
> 
> this is a bit of an overkill: you are forcing tight loops for
> 1ms. If you consider that the minimum wait is 1ns, in 1ms you
> will end up busy looping a lot of time. Please, don't set the
> delay_us to '0', but calculate a proper waiting time between
> reads.
> 

I also had doubts about whether this approach is too heavy. 
I have general concerns about the busy-waiting in atomic context
in this patches, though I noticed other I2C adapters wait 
for relatively long periods there as well. 
The tight loops in patch 2/2 are even longer.
Those waits are longer because the code waits for the entire I2C transfer 
to finish, but polling is unavoidable there since sleeping or scheduling 
deferred work is not possible in atomic context—is that right?
So this kind of builtin if doing i2c transfer in atomic context ?

I will reduce the maximum poll timeout to 4 µs, 
which matches the minimum I2C START condition hold time 
in standard mode and seems reasonable.

I will also increase delay_us. Out of curiosity, 
what is the reasoning behind the delay interval? 
I assume we want to avoid hammering shared buses
 or registers with continuous I/O reads.

> Andi

kind regards,

Thilo

