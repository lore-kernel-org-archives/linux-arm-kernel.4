Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WxLVnsyj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQXRs9sh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GndbZrwUbfBqaKKVhV2AQQy9aDOWXMWk0oUaJ06WoJI=; b=WxLVnsyjTswWmL
	Do1sQMnTZfLHxWFC7aWmRnzFSUY5ibv0D97maJ6InTEdk7UvJkNkLK9jVAZg+T6y5jQBJRlKDEW94
	gulSXSUPagxPnBnXe/HPOfbFncnZNazJY9VxqRU+ARCq1MSglyYivihrdLyoJTBhT+IMz7N6a7sEp
	ImYiJrMApa9oAtUnjUNqLmFqrFc/sAMvQgapnFLk+E7fN5GzGiovvV1fSEOFtgxHGqtdxVSCWrTS0
	VAAamNOYWDzWbg8se7+doq9edX3Z21r97gom1yTppxid5jCf/4EdUbw9c/zpvuqajxORJTTq80XvH
	PFvalj210rVDnXllGKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8ef-00000006rnI-3V7W;
	Wed, 11 Nov 2026 13:46:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR8ed-00000006rn2-34k5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:46:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65D4045947;
	Wed, 11 Nov 2026 13:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8302C1F00A05;
	Wed, 11 Nov 2026 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794404783;
	bh=GndbZrwUbfBqaKKVhV2AQQy9aDOWXMWk0oUaJ06WoJI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=jQXRs9shxUR7ARMscLRzhEIL2Dtiazu1tqGnW76tG76EOQIcS0Y7Ia/5wL3ShtC03
	 s6Id7orwVG5sj3M4c8+hHioBPGnpM65Fj7++VEMl4yjFZ/1u3eJE5E6yYUM0Hj0STa
	 qLV8/4xvq78KhMqeFVXgTSKmAMx2gWP8/BZOGkk+zvF+jpSivvFW3jK65CCNQEVo5p
	 6p2RbYgglU1VGdZXoNs2RucP9vfetVkGSX53FJmOLISsf13VOlKCpQmFYWyEDhQzbs
	 5kMySj+3Vh/RbkP9jadK1zpc0CbhhrSBKA/89600x4a+BxR31DqVEjroP3Aspo8glp
	 TgG9rQ7T3bRRw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id D19DA198003A;
	Wed, 11 Nov 2026 08:46:20 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 11 Nov 2026 08:46:20 -0500
X-ME-Sender: <xms:q3H0ahjpwr9W3uh0p7vIGgsEefncwLr1j4xNjQcqEe-OOFv-tADO6Q>
    <xme:q3H0ag2jF1EcLIS5H2vpPZsJRcbELUhJsBZhcV6SILlbtwwnz3NlQpsAxxo1TMRB_
    BO59-Mn1bItgrNzamhmH9q1ouZfKyZtKWp9FewZmXFS76sAw13URvY>
X-ME-Proxy-Cause: dmFkZTGXUnhNKAxQHRMfdjsVivKYFsnQSiOm5Ei1hWmU9E+QjqN6HqgWQ6pU/i4yfMANbF
    2hWvuoja3vCdMHzUGEwHaY0cB2IXw+XfJlUU2apbFHoN5QJWN0SlEPIvlwGN74Pk5cUcDu
    g9xC99eWhq6AbfaxwOb9D+aL7ahRU3XZXLDDeHcBb4nVoB411umga+fU/yQyQAjRttL54K
    RxXcozSHV6tAKuKMERvB5cW/uzPLQj60J+HumErHAt/fPdB7XvwJoOsOb81WcHSqlxdK3f
    E2DWGBNQ4p4kq6AmzB7X6O8ieBYDmiem327cbmt2P2kk1DZI1UCLIddmoyXMh+EEuLjmpb
    RimM+ccQmmupukQjuiCTQSRKAbdRYmh6qP9pZhkErlZhNnm430O3WJZOSDdF+qEHP60FVN
    3rZ4u+GS6ydvFOzbp3FI3lF9v38g/z1w18NG5PmU9+5hFm6Sj0nLvE6azl3cXqZZ9KPMQ1
    +TwjsWe4LBdidE/pA1BgPO8PM3+NNJHMJiAay2ICauUht/DCCS7nv5cy2t8oi2fLMb+yYm
    SMSeV4Lv8ZKqneUHvfMoYDKnB/4DDivKrnM3Kr9JQWUblPnh4NGyfy0qp2BdzFoyFghDFH
    g7u5ys3NGLgNhw3z0dEH0j+15QvGPGo3t2tU2N7664glGOtUsJJ7GwhcY0Pw
X-ME-Proxy: <xmx:rHH0asQuFs41qzfMBZ_FNtiDTeXxQrSe5e_3onmYTyi46NK8V33IXg>
    <xmx:rHH0asXh2fT9Y-xZazi5d0eL3RayXyYBfMCKROb719SGa844cddw2w>
    <xmx:rHH0atfzVYDJCFP__ISm2ZP-0JShdiuyyZYVSGEMn-INPMuMQSgMlQ>
    <xmx:rHH0agKybCf0aOx0qKjB19Z6Hf0TSbvVGbeW_Sneo9HHZxx1HBAw4g>
    <xmx:rHH0aqzGjcii_GqOT4VpJkNR8qz9RpXPf6ij_slu9s_g8s9m0Zem8G2D>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E1090F8008E; Wed, 11 Nov 2026 08:46:18 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 11 Nov 2026 14:45:58 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Abel Vesa" <abelvesa@kernel.org>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Message-Id: <27227279-dcec-4e46-916c-5d65ad8ca086@app.fastmail.com>
In-Reply-To: <71d569ee-a939-4c41-b32f-985d7db4040f@app.fastmail.com>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-11-ardb+git@google.com>
 <t6qm3ktezem4fjeqbo3r3z3ptzjvwlgjuz6kn2sl6z4aj4rkzp@v6mfpglfzixt>
 <71d569ee-a939-4c41-b32f-985d7db4040f@app.fastmail.com>
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



On Wed, 11 Nov 2026, at 14:15, Ard Biesheuvel wrote:
> On Wed, 11 Nov 2026, at 13:43, Dmitry Baryshkov wrote:
>> On Wed, Nov 11, 2026 at 12:53:06PM +0100, Ard Biesheuvel wrote:
>>> From: Ard Biesheuvel <ardb@kernel.org>
>>> 
>>> The SN65DSI86 eDP bridge on the Yoga C630 is described as being clocked by
>>> an always-on fixed 19.2 MHz reference clock. However, as on the SDM845
>>> reference design (Cheza), its REFCLK appears to be fed by the LN_BB_CLK2
>>> output of the PMIC, which also serves as the master clock of the WCD9340
>>> audio codec.
>>> 
>>> As nothing tells Linux that the bridge depends on LN_BB_CLK2, the clock
>>> only runs when the codec happens to have it enabled, and the WCD934x
>>> driver only enables it on demand. If the bridge is brought up while
>>> LN_BB_CLK2 is off or being toggled, e.g., when the display stack probes
>>> before the codec, or while the codec is being initialized, all AUX
>>> transfers fail and the DP PLL does not lock, leaving the panel dark:
>>> 
>>>   ti_sn65dsi86 10-002c: Can't read lane count (-110); assuming 4
>>>   ti_sn65dsi86 10-002c: Can't read eDP rev (-110), assuming 1.1
>>>   ti_sn65dsi86 10-002c: Can't read max rate (-110); assuming 5.4 GHz
>>>   ti_sn65dsi86 10-002c: DP_PLL_LOCK polling failed (-110)
>>> 
>>> So describe the actual clock instead, so that the bridge driver keeps it
>>> enabled for as long as the bridge is powered up.
>>
>> According to the schematics the actual clock is a divider clock coming
>> from the GPIO16 of the PMIC.
>>
>
> Which is always powered, I suppose?
>
> So I suppose that means just the arbitrary stall resulting from the
> clock enable is sufficient to make this issue go away? Any clue what
> else it might be waiting for?

I've just double checked with the old DT: the system comes up with the
panel dark, but as soon as I do

echo 1 | sudo tee /sys/kernel/debug/clk/ln_bb_clk2/clk_prepare_enable

[on a writable clocks kernel], the panel lights up fine after I blank
and unblank it.

Could it be an error in the schematic?


