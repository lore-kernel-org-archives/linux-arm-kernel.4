Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A82606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 13:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RGE/FvEl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aeh42kva
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=; b=RGE/FvElKlvzJ0y+Mhp16SeGVr
	WI5YHUfKdmiq5xN6y0+ZEuKFVlWvNSCgK4imWUVAh7BoL3yme+yGQxzkAcFH8XdbnICqkdOC/absd
	OoSqapXV/57tbAr94qeZF0Os2UnTJ+miGHDIOvMc31q1ESLRr+UMaDofj6dSNgwE/ayHqRm3ngC27
	+TVjQ+anjkjkPnd5b3XBkNchgHK2WrHkbqCuJhvh2g3J9jZ/NBodMXOBt3VCHClYF/FE+FBv2n8zD
	g0bhljFG1+1PDxO+0ezU2tN3z1B7zHLJeIM+9oDzUB4b5X/Lfz6d+MgjwB0qgTXmYD9GyxS2NMQS6
	KBWF+4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfMv-00000008ugP-3YWo;
	Wed, 18 Nov 2026 13:06:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfMq-00000008ue6-1CQt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 13:06:33 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3ae2b7e1e17so587501a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 05:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795007187; x=1795611987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
        b=Aeh42kvapCE+Liry5otFuzbqLm6x/P4EhsNgqr3817+/RW/l/cnyAROwCs0Cjy6I9X
         0IAIMF2e8OIYg1+UpKIVfuDiWlsZBe8TFI14I83MkqrUemO0vJTeD2B/4uO0769Mqtbt
         BXGnK6N0x+ODBSkeI90hhz38lt6D02YFOx2Mypp9CPyNOtKO9Om+kNw9EWsVIayAM+ul
         TSvimsMAcY+ZufDpZLKBwaunmb71QgGHMb2XgwNQQh3iseIhsCO1zGnGLZz2CHo+2XC+
         mOIsw/ovlYk9waF2qV5tc8pt5i7iWiPn50vR+zORBkrydHVUsfXRqf+rYoXMKypCcfsV
         xAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007187; x=1795611987;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyYtVveBhQy52iIUqNxGmc614rtRmx5Sogui3LnM34E=;
        b=l/CMAC+Leolgfc+TAlGzwXB8ZGC3hb5Qyj70iE1ZcLuDuX15lPqDlMlLF819eAhzqp
         NPpIuiZlNd1FYTGUJ8rwjQplbSj3Kf/ypIMOF4nq26MptVHMYB+I+zbWpGOoOXDmOhiG
         bbc6upL1KqM+LGsxDeVyDAJbCWgWH0KDmclfrHyvCS4byA5V5lL596qVr0f6W46DM6VW
         XA2h1r8Nk4kRJr0ilqPF5zFzaSgsq90X/PTgd6U6HDEhxs2QhHUns7RSwTZKqBr2R9uW
         Zu6tc8eRPLarqjGkFTnpzzLT6DvN+15IcjqHFiyr2s4fMMOHHAS1MvZc7Y964STQvt1B
         hV9Q==
X-Forwarded-Encrypted: i=1; AL+hErGtTSxVRiE7M6KZIW5CJr3QIqvem2L4Xqcp68LMLbjQsPucjd5ILAkSq0Ox6p+teGr811BkcV96mDvFj59yZWGs@lists.infradead.org
X-Gm-Message-State: APuU4Z+kSNZVJD9pO1ymAsl3P7FE8ji4HBezvPmScvx9aDosfxjTupeY
	jznH+QT2m9n2rAPVYxw8brOUlbzCuvUhgKfbRod7rc4vUW+a8FwhE2/a
X-Gm-Gg: AZFdTZcv4esPjMBNDNogUu8KrmoIrYtoYuCc90F2jlLQW6DcaXqvIn8WOHXYc4OtEUf
	c+8H/2HHb2GMlnz0aTAq/cFwcRy5FYQigp5QD59kqN59fMrbv2PZInsnMs+h4vX/Dg/DPXT3SFM
	t9vdH44Vg/5kjYfW7tNNZRwZO6GX03MHQDj6SQZWLCyHcbXmW30txhk4Xc5UqapxYuZoCuHM4si
	RgnljpjOt8QXHdZUqwflHc8PtOzyIz3yuKKjvNp5C4uPd1huLak+M1i++wWmObDinqbjtCdTpUv
	avgdsCgE0I1K6cynXKokScSCOgSaZBzyy23rxV35CBbXToWecdiqVD540KIB9RETQXPKVQy8BE+
	04d58/6YcQ3yI8HF03Qce34U4cB5MUY8sfUyh6D5Pdv08B59Vp3PaqyRdhV+wWk8Ccqd7ES+Nty
	M2Ew3jhBbhEAE63t3THXAI6UnhoOoyWnuqHVzSFa7bNy/SLTJ7T+XmpmcZlNJWXwiIQQOR0tR50
	g93s6EDvHfJwHZBwJykEGKqsUhr1V9nsZGj2tiKjeQ4nFzNTC2yzqcf+bqR1RCKvVq5UR4OTIX3
	d40vW7r0CmQW6XFFsxIV7+hyftHJOstd
X-Received: by 2002:a17:90b:2243:b0:3b3:c44b:b774 with SMTP id 98e67ed59e1d1-3b3d07a7a7fmr2534441a91.45.1795007186887;
        Wed, 18 Nov 2026 05:06:26 -0800 (PST)
Received: from macbookair ([187.40.224.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm4314633a91.15.2026.11.18.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:06:26 -0800 (PST)
Date: Thu, 19 Nov 2026 00:06:16 +1100
From: Myria Sarvay <myrialsarvay@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	Yuvan Shen <yuvanshen09@gmail.com>
Subject: Re: [PATCH v2 02/15] drivers/perf: apple_m1: Remove unused variables
Message-ID: <av2iyF3Ssa5mwgTH@macbookair>
References: <20261107-m3-plus-pmu-events-v2-0-acf1e78da039@gmail.com>
 <20261107-m3-plus-pmu-events-v2-2-acf1e78da039@gmail.com>
 <865wxu1jfa.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <865wxu1jfa.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_050628_331275_B225542A 
X-CRM114-Status: GOOD (  16.37  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 11:13:45AM +0000, Marc Zyngier wrote:
> On Sat, 07 Nov 2026 10:48:49 +0000,
> Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org> wrote:
> > 
> > From: Myria Sarvay <myrialsarvay@gmail.com>
> > 
> > These variables are calculated elsewhere as well, remove the extra dead
> > code.
> > 
> > Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> > Fixes: a639027a1be1 ("drivers/perf: Add Apple icestorm/firestorm CPU PMU driver")
> 
> Not quite. In this patch, the variables were very much in use. They
> became useless with 75ecffc361bbc ("drivers/perf: apple_m1: Refactor
> event select/filter configuration").
> 
> Please adjust the tag accordingly, or just drop it because this really
> isn't a fix, only a minor cleanup.

Yeah, sashiko picked this up. I had fixed it locally for v3, but was
just waiting for other reviews before sending another series with just a
fixes tag. Thanks for picking it up!

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

