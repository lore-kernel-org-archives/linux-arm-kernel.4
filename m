Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC98606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KmR4k5rT;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=XU1Lk5w0;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0cGPAQzH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6y/Vwdb7m8Q4VQEZiWRGa4EBI0ZcNW5mrZJmNnLAIEk=; b=KmR4k5rTFGh87n
	4TXLN5296v9DGhM1uHq6k7CpY7JVlGcJVIWi3MaLniBTnXGFWaFGFfBLOyiJ3seSsIrXTNLhgYnyv
	GbP29v8Y5ZiKqbMrmcm9kjoCSBkx/nbG5cCcmjFnkwgnlx25MIYUUKhjP3UCwV1HmsWGd/ZH2eZIy
	H/3REGrJ6aMH7D70PAlWRvXkRw2eQuUumpPYgfSYSlVWz5tCw3pyftFkgYC+AXYLG+Jymxw7Mfcna
	2ZWhWLzghkJtYC/OuSBl2vc67RpSZa0XaE6ADeayraCjpK3Df/Ol3kV9n4YggIYevGODJK+kbFNGV
	ULB/VKiht5IpAnrNELSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnQu-0000000CCT4-2Yml;
	Fri, 13 Nov 2026 09:18:56 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRnQq-0000000CCSS-3908
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 09:18:54 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9930D7A049D
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 04:18:47 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 13 Nov 2026 04:18:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794561517;
	 x=1794647917; bh=6y/Vwdb7m8Q4VQEZiWRGa4EBI0ZcNW5mrZJmNnLAIEk=; b=
	XU1Lk5w0uu+L798wbsZMLuM/oLYfa2jptOAdI0/brmVfRTwfItVhsy3/WAwvax1F
	fuaQl4/YNqrjvvedfsQ98apUbuq2EWa3KR/0yNMIo8oMGN6RYG2KhrIIjntO7XyE
	3T/x22Q0ofh10QVEM3ULAFsFyWj3odFZ7AoKT22lf3icg2StEk+zw2eVVSKHPx+k
	jvSYUMM/Ua6Iws2yFqcpGetJUD14kijTlkJiW8MpsS1uZxK6FFg9urFhVnwDhwlk
	Q2sm/viJV6LlSQ9L7J0bNYRhncmf/YGINIJsD/H/Jcg0bofs5O/+sC/SeoLB0FIb
	JBzviiALhI7Sr8vj5M0l8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794561517; x=
	1794647917; bh=6y/Vwdb7m8Q4VQEZiWRGa4EBI0ZcNW5mrZJmNnLAIEk=; b=0
	cGPAQzH3SBhTsnw+2A9ATJi83tr8tGmI+3kDDLfaTEaRbD5laHcp8CEuyufeolH9
	jURzrwqeJ7ww6MXCBKDrknmhPGSRPic4aLVzEIABu0DK1XaLZxihlxBePOJqkVI7
	8U26SDrkzAAubG/VO1ysi5U+MZosEKyDySXbdlR14MknUMkpTa2U73QgwVPhGWo0
	1CRBlJ2Jo+kwqpRUt2hOGj0KXxfNA9ddfC3jatqzvpCv/BoiYk4TzDg5zI/t7r+q
	VtSrxa3A1dYMyBXFDt6yYVgyPOWgq6KEsM5mSRXJi8NyFP8ps0wXYBQGOlvhgcdM
	8GGdR0qeBeN+LCQipeAvQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794561517; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:mbY6ohC6VweHUVc4M2Oq7ZTl01Zjfr3O71p6XcwQ7MgTR5w
	yvnuu9JPg5+dWOEMRricgmbC34+P+VRVXUa4pT4r67Su8e708kSv9RGymzzO6lD2
	xzF747+nAq2DaWB6rIevnGdUaJBF1Y5WNBd9/WrLjGAAEPHbvFw74GmKHxIVZKSq
	UsOusSdTBrD1ZFgnRW3Sv9PZ4d8yEQCAajv43fF7tApnoqscOIFMBcSEXfWyTbcY
	8Bi0ecbfEiPHvVBOFD+R9vT4mzU1+8vwfSowBom9wKqCWNxNPsfdSI2tawuc6e/Q
	RAS5mj8W3yDvc8sJK/AMMuIY3sG+CDvxkyW+E8w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vxkME9aONuWR23Ea+xNeRHIFYOKp3Ac+/gT4UmzDtbY=:vv1cmvtVAPstmIXGMWwsHMK7bkwINRxjdcmQxQpM0k8=;
X-ME-Sender: <xms:59X2attsw9jzsR2DUXa62XldNiNGsOnYuvtuSGWCEWJVshM_h3vLtg>
    <xme:59X2ahTvdP4tih94hNRex_pSoHh7BSjTgNR3au7lIU_BLhrc0JNfgH1QHALo6fbI9
    F2P3TSxOICtcRLssuCHUsnZCIZfOrWCz5_RdAhRNdxTrFkjkvmYyGtxvg>
X-ME-Proxy-Cause: dmFkZTFVGdrpsZrdpDlQwvZlSXs02XDBfEcLRW3P1tW5KGZAS4C4fdOW+W5npGRXES212F
    utLs+hHqpTKLWMZ8tmzA9bRCMjG0dVFWaSgJP+Kckx36Uhk3RvGJbOg+K4+tlArKmH5okZ
    6FgrfzpHTKtyBWqQtQ5SXsJIHv2n58bHsVCtj2LHVz7CM+T2lcvIrMZU9wZdnHcSztbo3Z
    PRGrfN5bV9fOZ8IBqi+gkiEDpyNnnh9UROjquhjmwPcYIK/5TwNMJ3JjwjX/ueMEKWjrBo
    A984hL86fNebMBTXelnTURIMGALHrSY516+YwVrZluwfyr2j6zlviEFXVo6AMfekpGh+YM
    9c7UuzdfAJ4GPX25yxpydOysxG4iok0RzNv8mvAsX9+/oOTxH+YneYQynPdVFxaaZ/fhrp
    I+cvtUg/aCxktQ8IVzPAKNgg7FDajd6PMTLOh81U3GlPlYGp0BGc2zo/dxBTVxkXAHr8Zy
    6X3adHnyud1c6HaY/j1ad5kiVuHeb8/Do47imt06tXJNNAOg7/FxaVQQCVEAQWbqwQu6sl
    BZaqbgAGHOJsRnqob8hw23nUoUuidlrWANfNd4fkJJlU7qivtKsw6n3UxSJSZq7Yxx2PlU
    +quMQCQmgDc1BLWKWPSNYJB/IVjbT8IwBH0VeL8UOfE0sS3NBxiwDMRpchuw
X-ME-Proxy: <xmx:6tX2agqyKoQmSsheqqC2_7zSEJ_p8jtnYFSH9zQgk6vHM_U9OcD1Fg>
    <xmx:6tX2as8NGURzv57ffr7OrcTGIoV_qwI3Qi5wFRpU6pQqvFxRPgEoUQ>
    <xmx:6tX2ah4yH9TU7d222ttOVwAZD23Qqesdxspq21XIczL7_LjK0nQ87A>
    <xmx:6tX2amjDrofUuFTMkIbeFBNLIsmZOjajRlgRPWVYfIsCOlPeVITU1w>
    <xmx:7dX2amMSM3lU66UWuHc95ZrHdkPEHIlb_f9fZLmlQxUm6A9xbSczPzX8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0B16132A0099; Fri, 13 Nov 2026 04:18:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: AmcrnnMArev7
Date: Fri, 13 Nov 2026 10:18:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Siddharth Chintamaneni" <sidchintamaneni@gmail.com>,
 "Fuad Tabba" <fuad.tabba@linux.dev>
Cc: "Marc Zyngier" <maz@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Joey Gouly" <joey.gouly@arm.com>, "Zenghui Yu" <yuzenghui@huawei.com>,
 "Steffen Eiden" <seiden@linux.ibm.com>,
 "Yicong Yang" <yangyicong@hisilicon.com>,
 "Zhou Wang" <wangzhou1@hisilicon.com>,
 "Navneet Singh" <navneetsingh@microsoft.com>, apais@microsoft.com,
 rlmenge@gmail.com, hargar@linux.microsoft.com, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <0a5e252e-1494-4b0f-a761-d984238c9d0d@app.fastmail.com>
In-Reply-To: <20261112180741.17614-1-sidchintamaneni@gmail.com>
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev>
 <86fqxwzul7.wl-maz@kernel.org>
 <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
 <86ecdgzp6m.wl-maz@kernel.org>
 <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
 <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com>
 <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
 <040cf379-baba-4e3a-bf3d-6bc009a9e28d@app.fastmail.com>
 <20261112180741.17614-1-sidchintamaneni@gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_011853_290293_F21FDC11 
X-CRM114-Status: GOOD (  19.40  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026, at 19:07, Siddharth Chintamaneni wrote:
> On Tue, Oct 27, 2026 at 02:48:29PM +0100, Arnd Bergmann wrote:
>> On Sat, Oct 24, 2026, at 09:14, Fuad Tabba wrote:
>> > On a host that runs at EL1 (nVHE or hVHE), this also requires
>> > __init_el2_fgt to set nACCDATA_EL1 in HFGRTR_EL2 and HFGWTR_EL2, and
>> > __init_el2_hcrx to set HCRX_EL2.EnAS0. Without them, the ACCDATA_EL1
>> > access traps to EL2 and the hypervisor panics, and so does ST64BV0
>> > once SCTLR_EL1.EnAS0 is set. Happy to write those and the KVM change
>> > once you're ready to post this.
>>
>> Thanks for the offer, that part is definitely not my area.
>
> We are preparing to post the Microsoft Smart Data Accelerator (SDA) VF
> dmaengine driver for Microsoft Cobalt SoCs, which uses IOMMU SVA with
> direct EL0 ST64BV0 portal submissions carrying the process PASID in
> ACCDATA_EL1.
>
> Now that Fuad's KVM guest FEAT_LS64_ACCDATA series is queued, are you
> planning to post the host ST64BV0 SVA + EL2/KVM patches as a standalone
> series soon?

Yes, sorry for the delay on my side, I'll try to get it to you ASAP.

For my understanding of your requirements:

- Is that hardware using an SMMUv3 or a different type of IOMMU?
- Do you have userspace calling ST64BV0 on the host, guest or possibly both?

> Either way, we have Cobalt hardware with FEAT_LS64_ACCDATA available and
> would be happy to test your patches on silicon, or help put together and
> carry any remaining pieces alongside our driver series if you prefer.

Sounds good, thanks!

    Arnd

