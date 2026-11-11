Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32084606A334
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3B5thIna;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzAgydeM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bK7cdOOnFx/2PymhbxFiGmyvokSNo/ky1iqCvz0rA2U=; b=3B5thInaN1V+P+
	HIQcJPhKkVc1oH18pKxIjXNmBE6TcD95Otq7kPh2zFXv1zANyOKawwvLhfQdmqyREqUUBFKoQ3JxW
	BVGOhNvWB5K9oaeeObzSogDQ3qyec/87QmthXGLWDQ/Vcjo68qzsvRU24mHBqckCisoVpo8/cBuNF
	QlUXEKNCKCej+43r/VLkTJnE8eDXrDOyxzH4gpGdSlHNcXtXBcWWLg1RnwSgh2lKKGXQF9Y/LJJM9
	OIWaTs3c70jWlz/KGjBR4RMZxgm6uiE8hRCUhF9gHIc+I3MZ/6NddmBGMqkVdpiUCsTTznUaKJriV
	YOXFJsab49TC7wyqz1qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8BV-00000006nHP-0WPS;
	Wed, 11 Nov 2026 13:16:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8BT-00000006nH6-2GKP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:16:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 87D4E601FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 13:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF9D1F00A06;
	Wed, 11 Nov 2026 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402974;
	bh=bK7cdOOnFx/2PymhbxFiGmyvokSNo/ky1iqCvz0rA2U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=ZzAgydeM30zoBTIHKks2bbNY2Wcui5iMsfXxDxYGUSnbYSUpl8q7Hr0eBP8oEk5Bx
	 +TUI/QVdw0R2w9WGtw6wbEgkXTHeZdRKfG7m56Forcmr6PSsTSIEx7q+zzhJr/T9M4
	 GHE7UWVzo4AAZIesebnrStgZx3kcBJjTP0gReXJJUphtxNxnVgwjhpcCpA5A83xCce
	 wTIrB4Ita96U5zECi45NudHCwgYthaRqW1izvadFs7fSeZKbdy0iAqvVQVotg/gbIa
	 n9b5vm5mLjAeUr3zOkF3nSN4Y7PeNR9qyuWtz+7LlU8zUiJcWfQ1URIVrXgLorcAaL
	 KI50fe4lB/TsA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id E26FD198003A;
	Wed, 11 Nov 2026 08:16:11 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 08:16:11 -0500
X-ME-Sender: <xms:mmr0agkOpOK-drbUAH4HWnTjn1MrEEFYRqBfLpLYLDiEKWDCsInMXg>
    <xme:mmr0aqrjUH5y7gvm-tr-1BuGwDfL4yEF6Gx9T3mIekLzrK838mOONp1CmoMWYUkoT
    -yuh2zYbJD0Wz90AYHhG4OQclI7-f39JjnPebfm9LZW3Y_2bllZnjM>
X-ME-Proxy-Cause: dmFkZTExZcKeII8UgSAR+8hWTVmAJdJQpdc+/g4k5JmHwUqceTWHYaCvgMIPdb7ADJ+sRt
    CIvsqRYbrIWyI7IwtAaEHNc7fr6iXmk0mWVsykAlZCenHVoDo2JOly2QAbBIqH1XsLjtkQ
    w0OowQon3ndOr6CqHuBFUVwOdXkO8rZvl7P2vVvMvfDVgSUL22CI9Z1xpC4xpl13v7hlUZ
    L6mFzh92EcDrtmup23Wjmed/Cz3wlp08q3wC2+i9HehwU0naDSS5bAiAn4CnH/otEyNxxk
    zfa23jofxg7lmJ64G+o2nzb2Iql7yj563NYbBfvub4HydI/cjnY1j855MIgIdxSw/VtCMN
    arQLWYS6yl3pW5/pmt/5zvEmu3ZEbE7x7az38lCRFSE1JIWZrYo6a/9vatQPzadrjdD7py
    KjS1cXJlExQDf2ZJcdmFCRXaD+dqHA1G/gbHpmN/AFm1O87AapTM7t3OPHW6a+YN325j56
    xSpCiGN/6+qO6RsnBE90HKsafiA8L35bpOjJv515Jf405ZFJUFOVYHtAbrmXI9YDTChCTp
    Qa8BcHN8LPkFAVkXYctpyKf+0Izznrsc8TwWMNdPrIZ/b0cZWRhFFlooyVAumUir7HCbhV
    nQt4PzYRk7s2jHva7TL2172CZ2UwiKuA+mFHOkNhcD7agxrQrxqSw5D1qb3g
X-ME-Proxy: <xmx:m2r0apXDBki9Xsmiur_YFC_iP5L9VEIHUCKi49-lwI7DduFkZufE7Q>
    <xmx:m2r0asIEqXRNc20j_INRVLT1EKBu34if3QNkHZW094ytOBepl7zUZg>
    <xmx:m2r0apAnM6zDze90Dd0htTT0QSi220GvsztLNCJSQqulk1EUk6HSsA>
    <xmx:m2r0asftn61O8jven-3lUahTEkW2C6iakXXWy0alzYtvmjG-Qg9TUw>
    <xmx:m2r0ao03reMPXFwzb86bMRtCZPUb8kCMYYQ5S5Uk_1gaHWg5bGRFIeKI>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id F23F1F80098; Wed, 11 Nov 2026 08:16:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ant3Zsh03RDg
Date: Wed, 11 Nov 2026 14:15:49 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Message-Id: <71d569ee-a939-4c41-b32f-985d7db4040f@app.fastmail.com>
In-Reply-To: <t6qm3ktezem4fjeqbo3r3z3ptzjvwlgjuz6kn2sl6z4aj4rkzp@v6mfpglfzixt>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-11-ardb+git@google.com>
 <t6qm3ktezem4fjeqbo3r3z3ptzjvwlgjuz6kn2sl6z4aj4rkzp@v6mfpglfzixt>
Subject: Re: [PATCH 2/7] arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP bridge
 reference clock
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Wed, 11 Nov 2026, at 13:43, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 12:53:06PM +0100, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> The SN65DSI86 eDP bridge on the Yoga C630 is described as being clocked by
>> an always-on fixed 19.2 MHz reference clock. However, as on the SDM845
>> reference design (Cheza), its REFCLK appears to be fed by the LN_BB_CLK2
>> output of the PMIC, which also serves as the master clock of the WCD9340
>> audio codec.
>> 
>> As nothing tells Linux that the bridge depends on LN_BB_CLK2, the clock
>> only runs when the codec happens to have it enabled, and the WCD934x
>> driver only enables it on demand. If the bridge is brought up while
>> LN_BB_CLK2 is off or being toggled, e.g., when the display stack probes
>> before the codec, or while the codec is being initialized, all AUX
>> transfers fail and the DP PLL does not lock, leaving the panel dark:
>> 
>>   ti_sn65dsi86 10-002c: Can't read lane count (-110); assuming 4
>>   ti_sn65dsi86 10-002c: Can't read eDP rev (-110), assuming 1.1
>>   ti_sn65dsi86 10-002c: Can't read max rate (-110); assuming 5.4 GHz
>>   ti_sn65dsi86 10-002c: DP_PLL_LOCK polling failed (-110)
>> 
>> So describe the actual clock instead, so that the bridge driver keeps it
>> enabled for as long as the bridge is powered up.
>
> According to the schematics the actual clock is a divider clock coming
> from the GPIO16 of the PMIC.
>

Which is always powered, I suppose?

So I suppose that means just the arbitrary stall resulting from the
clock enable is sufficient to make this issue go away? Any clue what
else it might be waiting for?


