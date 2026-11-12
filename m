Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1714A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xaEsJD2e;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XPaNTMBm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k1iKJ3ce6I7V1KzAt6ijmlB03GjSeH93EgIWrRWokzQ=; b=xaEsJD2eOfdYft
	apgK6Z1dB4NofBFRI5/QyvTHE8ZuBn/D/0Or639EyH4redIQbhg7NUeB0Xbc+W3MAM7Y6EB6HOjKk
	sLLNulULsUVKmdaIG1IYPS9i3/x0naKaUZBwafi/G625roVmsa4Uloqb0QdRQZ4ETVqLFKL1imF8d
	N5CkLJM9iBn4LaXusBlwPc19lU8JNl7+oYyNWcQs4nQKnLNw7EyqPzpKPPwrNeZLIeRZWGkVlLrFv
	ptGazkfFspINJrGLfBqPmuePH8RN/+jCUc/LueyCO2GhFsjnGypha15UdLhtdwCqBIrZKhSx1tN5Q
	+tbFxJeh0ooFcpE3rwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZDD-0000000AqOK-3mCm;
	Thu, 12 Nov 2026 18:07:51 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRZDB-0000000AqNi-3xbw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 18:07:51 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso54370a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 10:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506866; x=1795111666; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1iKJ3ce6I7V1KzAt6ijmlB03GjSeH93EgIWrRWokzQ=;
        b=XPaNTMBm1RS+woQup3KngQoS+bRVYSbrIqJD8Yy55rvs2sQKpN37aqxsC6FKu2k7Ec
         iejrlaiQnbpjUrjC2CyDNaZVyq7UyUSUOapu/GO0dxBYk5t+GgD7HHGdOHWR1KFA2kyn
         dGXZj41QAHvRri7eqpvaM4oEmSAvhwNc0i1bI8yHsEgPBXFLXsLnsSta2byC4JZ09/0F
         eJn3L5A8t0sSeYYMXtU02ydGTD0ztsL0ADfM+D+6i4loFZlnNxy+DYCWfNzZJ2YabM3s
         gmSTx1oYM/H/PwTkboscpwSRHkHHK8cNg5SW9WAszihEvTuUzowOgs8E7360swWpedNd
         WMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506866; x=1795111666;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1iKJ3ce6I7V1KzAt6ijmlB03GjSeH93EgIWrRWokzQ=;
        b=IOqHAHeWMXW22A5DLbQcmI+Tbfd0WSU94vc+x5ke97S5Str9VEKHmNbpn8+81JvO2I
         XpKbRn9iV8I6PXB4376kGsxjT0iTSM/7NqWhe0tW+NoUdefTphwvOKgaGxcTMeKliWff
         EajFX6u7I1Ou5W99OrG05hyHh2E7gFKnysk5Y7G4cDYPu6q0PEXEdpiR3cGthr5lIBt8
         vNXVLTUTX8Fw/uDVhW8vex6DBqhCmLKf3hJNJOFD5O50LreibY+PNwRyclnYgSajYu13
         DtflRuDA3wPB2zXBd5gOKzTGhlsVF+yFjHuyS8rJR0NOS9FYfAE85XT3/w+2HsTUo8W7
         49hg==
X-Forwarded-Encrypted: i=1; AL+hErHoD8EwhG5NzmK/3W6jwuagC66goEyS3V7Rezg4eqfhfXcUNZ0E2BhkGkm73q18ecQPFvZ1x8YiA8NbVzQ1EtIg@lists.infradead.org
X-Gm-Message-State: APuU4Z8kXn5rVV9pGUUrFpHn01INHwp0cLGCz+BxrAhwM2jUm19JL++u
	h43RQXIVi5ePWLS/fOh/9RTFCB+16lelHzFjN6wrnaJ6PJ6wKL23CehT
X-Gm-Gg: AYBFou0OI7Pph7SwgXsjOXeuvbn6X4oWR+pp6e4JplEn9K2vUTxPB34jl1NLkGmAw9t
	8CBxYCBc3SJx+3hwbHtLg4Peq9nlSLaI2W8kW1bir+g/acIGPioqy/LH/j60SoP94YMb8qgQqPV
	wuaYRt/8L2bdt4wkhDNycjTzDbGOSWaAS79iiXIH2D7odQFT96XRVL5Et5cAIo/x8buqTMDllyI
	PTE6c8myctcGHMgzczqIo1lQSWZCrS7oM+KyTN326ZCouqdieNpd9pD5Mmjsagg/sB9hAde8VRN
	o44hsA74A1d7cYpp18Z+szRMXbR9PCaJvSDM4PN+Yoyo0Z0h5qIgV+4jNeqY9fPq25//W07fq23
	3yfrRv9KpdKT1kpONlky+TiDJ7sIoJtEyxJep2RMyOYKJnwNKCFeI+qo4naA02ShfsAHFecIYYU
	WWil4oazjV461yl9RHcys/5m5DXR5mOYP+OXPPeiWaL9WFPvtB6p6OkRuTBBImbILGHrpefBfq6
	IQah4S+XGmxoPWDMRGa/smtw3SxIHMW8y9WSxUzfqX1vJK+madQj1pXgbc86G5gsrMOyon5+dxJ
	7FFzmfCDzAJhT/bYdn6wYhUpEOki76i5V1gHsvzXjLLqu1r1/KCK5IgJ0Gh6GuzHmEoLVLd4eKC
	TDRFlnAwZWTQSyek/NoGRMA9X7nUasI4rp/mCkeMgPo60sKxUD7gKTBDqhqmvK2q4psAD5U/2r/
	M5VtJkD48iXTa8dEVQzNA5gE0hDbFXGaner0ayvvB6
X-Received: by 2002:a17:90a:e387:b0:3b1:8380:a9a0 with SMTP id 98e67ed59e1d1-3b18380ac2fmr4732901a91.46.1794506866237;
        Thu, 12 Nov 2026 10:07:46 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm5540773a91.1.2026.11.12.10.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:07:45 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Navneet Singh <navneetsingh@microsoft.com>,
	apais@microsoft.com,
	rlmenge@gmail.com,
	hargar@linux.microsoft.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
Date: Thu, 12 Nov 2026 18:07:41 +0000
Message-ID: <20261112180741.17614-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <040cf379-baba-4e3a-bf3d-6bc009a9e28d@app.fastmail.com>
References: <20261023070110.1833446-1-fuad.tabba@linux.dev> <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org> <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com> <86ecdgzp6m.wl-maz@kernel.org> <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com> <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com> <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com> <040cf379-baba-4e3a-bf3d-6bc009a9e28d@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_100750_051495_5A2D6318 
X-CRM114-Status: GOOD (  15.85  )
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

On Tue, Oct 27, 2026 at 02:48:29PM +0100, Arnd Bergmann wrote:
> On Sat, Oct 24, 2026, at 09:14, Fuad Tabba wrote:
> > On a host that runs at EL1 (nVHE or hVHE), this also requires
> > __init_el2_fgt to set nACCDATA_EL1 in HFGRTR_EL2 and HFGWTR_EL2, and
> > __init_el2_hcrx to set HCRX_EL2.EnAS0. Without them, the ACCDATA_EL1
> > access traps to EL2 and the hypervisor panics, and so does ST64BV0
> > once SCTLR_EL1.EnAS0 is set. Happy to write those and the KVM change
> > once you're ready to post this.
>
> Thanks for the offer, that part is definitely not my area.

Hi Arnd, Fuad,

We are preparing to post the Microsoft Smart Data Accelerator (SDA) VF
dmaengine driver for Microsoft Cobalt SoCs, which uses IOMMU SVA with
direct EL0 ST64BV0 portal submissions carrying the process PASID in
ACCDATA_EL1.

Now that Fuad's KVM guest FEAT_LS64_ACCDATA series is queued, are you
planning to post the host ST64BV0 SVA + EL2/KVM patches as a standalone
series soon?

Either way, we have Cobalt hardware with FEAT_LS64_ACCDATA available and
would be happy to test your patches on silicon, or help put together and
carry any remaining pieces alongside our driver series if you prefer.

Thanks,
Siddharth

