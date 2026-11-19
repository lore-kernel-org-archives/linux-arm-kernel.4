Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0352960A6F4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Hvk4pynU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nWGDqYNC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WGQr9homvcBDDaDNFjGaP7bjHcrXtaqxHaJKTI0quEg=; b=Hvk4pynUchP3AV
	BWliuMgHW08Lku3OGdjNI5y6ZOIsXVnMNl1v5LdaROHolQXoorEy0jUoBLDr1XIQixaFXI45F1NRH
	UwovTNkCyMrSnio+disFRgEF1OFVZc6S52Bi1Cxp99E0dC5ELZTjjTaTV1GL1vQWZsCtr4GJBmP4N
	PJERKomt/KLk+vYJ+qxLv5VMEQepHz3VZ5gClJzeFbNhVToTVZUyu5LlMSHHQ+75KEwGOilVvPC/M
	soirQVZvdQUncH8pNQbC0SGz9oe5NOdvCOlcP413JCJRjVd8oaOgtEohj+Wt6mKl4DTweBYBK0arL
	Ssw0+kq0j7KArw9UMqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4DZ-0000000CVGV-19aW;
	Thu, 19 Nov 2026 15:38:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4DV-0000000CVEe-0Eue
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:38:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F1BC66331D;
	Thu, 19 Nov 2026 15:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971581F000C5;
	Thu, 19 Nov 2026 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102707;
	bh=WGQr9homvcBDDaDNFjGaP7bjHcrXtaqxHaJKTI0quEg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=nWGDqYNCGgY6EsYektk0F3ocquHXbRy1fnBV1cjg2r5M/i1bmrbziHyQsCLWESUdJ
	 opBWD9W5X5P5mOOl4X7/vqsOz5egFXFqJAoPrL4wF2t4goJ4HyOW0XVMH95ZFst1+K
	 zMl6ZnTfRZ3zlTPlIVDjv/wCnHDmdeEMZiGZi3Oz2oDcuTE9oVH8vy/+c97AqyrB06
	 qfAK6S6U9Kmd9ZtWqMyHpCYtStkgZRJhpi9hovItWRr9tH5NJJXztFH0dK+aOhgXFI
	 5abk/OIW6k2WsjCfCEqMkNRBGtntyyVmO0X4Bua4NEszIh6DdRYDzmfJ3kdQhFCz/+
	 HsHGJtTPB/JZg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id BDA09198003A;
	Thu, 19 Nov 2026 10:38:24 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 19 Nov 2026 10:38:24 -0500
X-ME-Sender: <xms:7Rf_ahjoSDHuY-li6z80mwYOQLNJTGQf1s9UH2cE69IDojYofOJwPg>
    <xme:7Rf_ag02Px5PS4iBvm_FnNjsIZ6ZtHQjpcHB8i3JsRRyvwbq0U9FF8ofWY68gj4vd
    ihV1_A3F1imUG4RxW7k_Qc7xhu6BK1y-71x4MxdUuBj2ooChhuX7UHh>
X-ME-Proxy-Cause: dmFkZTFjUXYloFjoDllRlpZzwX+Mr2aQT9ODXP8XGqHiLINShhj92g8SnoXLjarMGxqFOO
    oMDZM9EMatC8AGeg/TSMAdaFkP0NJsv1RNjS5Z5wWE7XSkhmx4jF+oLRVh3mFvSxwbe+xk
    nU298dZTxAa+bh/zAwbQbFPI3xyGDOOUS+385VVsVL1+gnA2mILXuFwfM0DajlGwagkkBS
    u27MEZWc8i8uC/2bF9euzQlyo4MLEJN8OuSZrtvxdRVK1sYclzWbHdRfR72lilcXQx0dLz
    i3W7h3MPidwET8W+CEXkC+RoWeLCGzPYlagVwS2A5U3Y11yanQZV1s6/vZkWj53tyOy2AD
    pzA9vLhqXXaM9bjhj4TJ+RCvFGC+1d+/mxLqU4jENV6V9cg2cbVPnjK017AVB0ZjBJVpr3
    s6siunXhUGx205Yl44urUhkqQpwryhaQ70MGhoa6F+xWX5jg7c8biylL5yT1OMtAuJGuqr
    MwQHxiAoZwbrPftISKaf60cnPvn9tGs3EH+fVmm7/OTXfIjBXcfKM2Nm7amnjiiHF8O+nt
    od6D2ndZV4Tg8t2DNQYZ07MeZfFHqEw2FGpeLs+MY2H7cWkgrlHEGVW6tk8MNmtCZI2VbU
    zrEFfeiZRVlvNisMmkmYFY6hsVs+/dc+sZkZ36SJx+rOx3TOi3fFB/o/OTfw
X-ME-Proxy: <xmx:8Bf_ailq9KZsUJBEpXUEZIDn32ElvnIruMtxjDCpKznCpT1ZTkVThA>
    <xmx:8Bf_akG8_SUQdfXtfWLssOzQRlbG3JFU89ndf_BfWHbWgGdCiKq6Vw>
    <xmx:8Bf_amEpQKt3967seOdLahbvyYJbpHiNLFsWPrFIeR0LP7WwCukBZw>
    <xmx:8Bf_as3jiR3CjL8AoEsqrCL3Ad7TrusWoiXyrbNpceBqdUwceNWKtg>
    <xmx:8Bf_aofDdp_XnT9_bucLRcIiGEv1YKmTwbaVBT6hJMDgjrNll8blkGpU>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BEF05F80093; Thu, 19 Nov 2026 10:38:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 19 Nov 2026 16:38:00 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Sven Peter" <sven@kernel.org>, "Will Deacon" <will@kernel.org>
Cc: "Mark Rutland" <mark.rutland@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Sudeep Holla" <sudeep.holla@kernel.org>, "Janne Grunau" <j@jannau.net>,
 "Neal Gompa" <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, asahi@lists.linux.dev
Message-Id: <a1b18224-4171-4702-acb2-cef994dd9921@app.fastmail.com>
In-Reply-To: <ef76e141-491d-44a9-90a6-e9cd54526012@kernel.org>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
 <apldL6Ml91GW-tE9@J2N7QTR9R3.cambridge.arm.com>
 <aplk2hHRB7Yw9FWW@willie-the-truck>
 <eb75b82a-8910-4198-b89a-5c8b487c0fd5@app.fastmail.com>
 <cadadedb-1de1-46f0-9bfd-35eb8bdfa85b@kernel.org>
 <avxETlOGyr_WQ2zp@willie-the-truck>
 <ef76e141-491d-44a9-90a6-e9cd54526012@kernel.org>
Subject: Re: [PATCH RFC 0/6] PSCI-via-EFI to support firmware and kernel sharing EL2
 for Apple Silicon
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



On Tue, 17 Nov 2026, at 16:25, Sven Peter wrote:
> On 17.11.26 13:10, Will Deacon wrote:
>> On Sun, Nov 15, 2026 at 07:38:35PM +0100, Sven Peter wrote:
>>>
>>>
>>> On 03.09.26 15:25, Ard Biesheuvel wrote:
>>>> On Thu, 3 Sep 2026, at 14:15, Will Deacon wrote:
>>>>> On Thu, Sep 03, 2026 at 12:42:39PM +0100, Mark Rutland wrote:
>>>>>> On Thu, Sep 03, 2026 at 01:34:56PM +0200, Ard Biesheuvel wrote:
>>>>>>> On Wed, 8 Jul 2026, at 09:15, Sven Peter wrote:
>>>>>>>> This series adds a custom EFI table that points to a PSCI entry point
>>>>>>>> (plus some other stuff that has to be available before EFI runtime
>>>>>>>> services are set up) and adds support for this new conduit to the psci
>>>>>>>> code. We can't directly use the normal EFI runtime path because that one
>>>>>>>> takes a sleeping lock and we need to be able to call into PSCI from
>>>>>>>> atomic context during e.g. cpu bringup or during idle.
>>>>>>>> It also adds support for specifying the specific MAIR attributes for EFI
>>>>>>>> runtime mappings as defined in the latest UEFI spec since Apple Silicon
>>>>>>>> is rather allergic to using Device-nGnRnE vs. Device-nGnRE for its MMIO.
>>>>>>
>>>>>>>>         dt-bindings: arm: psci: Add EFI conduit
>>>>>>>>         arm64/efi: Add and parse custom PSCI EFI configuration table
>>>>>>>>         efi: Add EFI_MEMORY_ISA_{MASK,VALID}
>>>>>>>>         arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE
>>>>>>>>         firmware/psci: Add EFI runtime conduit
>>>>>>>>         arm64: dts: apple: t8103: Add PSCI and CPU idle states
>>>>>>>>
>>>>>>>
>>>>>>> I've picked up patches #3 and #4, which are useful in their own right.
>>>>>>>
>>>>>>> I'm not sure if the arm64 maintainers will want to consider this, but
>>>>>>> I think it's a reasonable compromise, as it puts the abstraction in
>>>>>>> the right place.
>>>>>>
>>>>>> Sorry for the late reply; I've been away almost all of August and I'm
>>>>>> slowly catching up on things.
>>>>>>
>>>>>> As with last time this was proposed (in abstract), I am not happy about
>>>>>> bodging an EFI conduit into PSCI, given that the manner in which state
>>>>>> is managed is completely different from SMCCC.
>>>>>>
>>>>>> If we need a mechanism for doing hotplug and/or idle without HVC/SMC,
>>>>>> that's one thing we can consider. I don't think we should pretend that
>>>>>> it is PSCI.
>>>>>
>>>>> What do you have in mind for an alternative mechanism? I understand your
>>>>> objection to this proposal, but at least it keeps the interface fairly
>>>>> high-level and avoids opening the flood gates for a bunch of SoC-specific
>>>>> idle routines. Are you thinking of extensions to the PSCI spec or
>>>>> something else?
>>>>>
>>>>
>>>> I can't speak for Mark, of course, but I could imagine EFI being used as a
>>>> conduit to provide a callable set of interfaces (with a rigorously defined
>>>> set of constraints such as the ones in this patch, i.e., reentrancy, no FP
>>>> or SIMD, not relying on ISA features that the OS needs to know about and
>>>> enable, etc).
>>>>
>>>> There is prior art here in ACPI PRM, which does something similar, and this
>>>> also relies on EFI runtime services.
>>>>
>>>> You'd still need to implement the CPU ops and a cpuidle driver afaict (no
>>>> expert here), but at least those would be coded against an interface that
>>>> the kernel itself specified, and can be made as generic as we choose to.
>>>>
>>>> Not saying this is all great, but it might be a worthwhile compromise to
>>>> consider.
>>>
>>> Finally getting back to this series...
>>>
>>>
>>> I'd definitely like to keep mapping the resident firmware using EFI runtime
>>> services because otherwise I'd have to duplicate a whole lot of tricky code
>>> to do the same thing via some other means (e.g. a device tree nodes that
>>> contains all mappings + callbacks) and I just don't see much value in that.
>>>
>>> I'm happy to just drop the PSCI part though and replace that with a simple
>>> and somewhat generic "efi-rt" (or similar) cpuidle driver and make that one
>>> have similar requirements like I added for this RFC series and expose bunch
>>> of generic callbacks (that will just happen to resemble PSCI functions very
>>> much ;)) via a custom EFI table. That would keep PSCI out of all of this but
>>> come at the cost of an additional cpuidle driver.
>>>
>>> I don't think that would open any flood gates for SoC-specific drivers since
>>> we could just point them to the generic one and tell them to use that one if
>>> they can't do PSCI for some reason.
>>>
>>>
>>> Now before I go off and prototype this: Would this approach be fine in
>>> general with you, Mark and Will?
>> 
>> tbh, if the "efi-rt" thing is just PSCI with a different conduit and that
>> conduit is properly documented, then I really don't see the point in keeping
>> it separate. However. I suspect that we probably all have slightly different
>> opinions here which isn't going to help you very much :(
>
> Yeah, well, I agree but I really don't have a strong opinion or any good 
> argument if either "efi-rt" vs "psci-via-efi" is better or worse. I only 
> think both are better than SoC-specific cpuidle and cpu_ops drivers and 
> I have no idea how else we could do this. (We could drop the kernel to 
> EL1 and do "normal" PSCI in EL2 then but that would be much worse than 
> either of those options imho)
>

I agree with Mark that implementing a pseudo-PSCI that can never quite
comply with everything in the PSCI spec is probably not a great idea
unless we actually need it.

> And especially with M4+ I'd like to have something that can go upstream 
> because normal wfi loses most general purpose regs there and has to be 
> disabled which is not great.
>
> I can also just prototype the efi-rt cpuidle+cpu_ops thing and then we 
> can take a look at it as well and see if that's better than what I have 
> in this series if that helps but I'd rather not spend that time if that 
> has no chance of being accepted either.
>

I think a consistent approach for both secondary bringup (+teardown?) and
cpuidle that is based on the same efi-runtime layer is perfectly acceptable,
and allows us to define it as narrowly as we can, rather than having to
consider what shared code might assume once it sees enable-method=psci on
a CPU, or a PSCI conduit (SMCCC detection, mitigations, etc etc)


