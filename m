Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1873A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2hwyeBtg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JGxA30+L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+1BpRIRf2nPGKzJFdVk2a4hDpuZJr7hID0LUitYqiDA=; b=2hwyeBtgRZJQR5cU+ctOuoPHmn
	xNN8zKG8+C1svBcsOOaylVBsr6LEGr50OQKWSzOIP5i4ycGfEgXSJEtdyBeMeEbLBWWQlkBywa7lm
	YCxxe59SQmAb4TUhUZlxJAn5PoRV42KEbmD7FxR181HQn+RJ+VZJDxpmdpIUTdTbiusGJDNnxLtOL
	rUUBITAXUGO5GnbSjFvaWCR6rLnWcurcH4iOfvcQlzjvjixTVOUqXiR7yTiBME9UAoyImBQnN/071
	OU73BeqYn2TcAurHquGvI6mJwUPG0rlFcyzMIx1KMcBtXFa0OjdsDBWlh5At6aE/O7LaEKUfpmw0f
	ZBkQNehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTI1g-00000005ari-0MGX;
	Tue, 17 Nov 2026 12:11:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTI1e-00000005aqe-2YgO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:11:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 86A966345E;
	Tue, 17 Nov 2026 12:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327E31F000C4;
	Tue, 17 Nov 2026 12:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794917461;
	bh=+1BpRIRf2nPGKzJFdVk2a4hDpuZJr7hID0LUitYqiDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JGxA30+LSayvTFpzFzaPwgAO/2s9/BHbbED1n1A/usLmbrL8nArMCz1gwId+3VYr4
	 vDKe/KQ1paoenZ68G4/rpBjJOBgLm1Jt/NURy/TBxhC3xyeAfeVS86PTz1uK3W3WBC
	 3Pj9cnWMyfS6WNMe4Kj9lyzaJ8v7GSCksmRx4dGex0aqXp11SvayvDc+kBic6z0WnF
	 cUFYrsuZOnDwSdtj7U5I8ieqgeOFb+oVXM71vR3MitFPShxoU56q0nRteRXS2mhONc
	 +fZqxCrtVWWe2Bkk4d/tJLyHLcgWF1/LDt/1dV/Zq0RXtOhJVV3GrLidOnBMZE6ETd
	 RFBgOdKl7eLyQ==
Date: Tue, 17 Nov 2026 12:10:54 +0000
From: Will Deacon <will@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH RFC 0/6] PSCI-via-EFI to support firmware and kernel
 sharing EL2 for Apple Silicon
Message-ID: <avxETlOGyr_WQ2zp@willie-the-truck>
References: <20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org>
 <9c53cfd7-e193-4441-83ca-7710060225b7@app.fastmail.com>
 <apldL6Ml91GW-tE9@J2N7QTR9R3.cambridge.arm.com>
 <aplk2hHRB7Yw9FWW@willie-the-truck>
 <eb75b82a-8910-4198-b89a-5c8b487c0fd5@app.fastmail.com>
 <cadadedb-1de1-46f0-9bfd-35eb8bdfa85b@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cadadedb-1de1-46f0-9bfd-35eb8bdfa85b@kernel.org>
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

On Sun, Nov 15, 2026 at 07:38:35PM +0100, Sven Peter wrote:
> 
> 
> On 03.09.26 15:25, Ard Biesheuvel wrote:
> > On Thu, 3 Sep 2026, at 14:15, Will Deacon wrote:
> > > On Thu, Sep 03, 2026 at 12:42:39PM +0100, Mark Rutland wrote:
> > > > On Thu, Sep 03, 2026 at 01:34:56PM +0200, Ard Biesheuvel wrote:
> > > > > On Wed, 8 Jul 2026, at 09:15, Sven Peter wrote:
> > > > > > This series adds a custom EFI table that points to a PSCI entry point
> > > > > > (plus some other stuff that has to be available before EFI runtime
> > > > > > services are set up) and adds support for this new conduit to the psci
> > > > > > code. We can't directly use the normal EFI runtime path because that one
> > > > > > takes a sleeping lock and we need to be able to call into PSCI from
> > > > > > atomic context during e.g. cpu bringup or during idle.
> > > > > > It also adds support for specifying the specific MAIR attributes for EFI
> > > > > > runtime mappings as defined in the latest UEFI spec since Apple Silicon
> > > > > > is rather allergic to using Device-nGnRnE vs. Device-nGnRE for its MMIO.
> > > > 
> > > > > >        dt-bindings: arm: psci: Add EFI conduit
> > > > > >        arm64/efi: Add and parse custom PSCI EFI configuration table
> > > > > >        efi: Add EFI_MEMORY_ISA_{MASK,VALID}
> > > > > >        arm64/efi: Honor EFI_MEMORY_ISA_MASK for Device-nGnRnE vs -nGnRE
> > > > > >        firmware/psci: Add EFI runtime conduit
> > > > > >        arm64: dts: apple: t8103: Add PSCI and CPU idle states
> > > > > > 
> > > > > 
> > > > > I've picked up patches #3 and #4, which are useful in their own right.
> > > > > 
> > > > > I'm not sure if the arm64 maintainers will want to consider this, but
> > > > > I think it's a reasonable compromise, as it puts the abstraction in
> > > > > the right place.
> > > > 
> > > > Sorry for the late reply; I've been away almost all of August and I'm
> > > > slowly catching up on things.
> > > > 
> > > > As with last time this was proposed (in abstract), I am not happy about
> > > > bodging an EFI conduit into PSCI, given that the manner in which state
> > > > is managed is completely different from SMCCC.
> > > > 
> > > > If we need a mechanism for doing hotplug and/or idle without HVC/SMC,
> > > > that's one thing we can consider. I don't think we should pretend that
> > > > it is PSCI.
> > > 
> > > What do you have in mind for an alternative mechanism? I understand your
> > > objection to this proposal, but at least it keeps the interface fairly
> > > high-level and avoids opening the flood gates for a bunch of SoC-specific
> > > idle routines. Are you thinking of extensions to the PSCI spec or
> > > something else?
> > > 
> > 
> > I can't speak for Mark, of course, but I could imagine EFI being used as a
> > conduit to provide a callable set of interfaces (with a rigorously defined
> > set of constraints such as the ones in this patch, i.e., reentrancy, no FP
> > or SIMD, not relying on ISA features that the OS needs to know about and
> > enable, etc).
> > 
> > There is prior art here in ACPI PRM, which does something similar, and this
> > also relies on EFI runtime services.
> > 
> > You'd still need to implement the CPU ops and a cpuidle driver afaict (no
> > expert here), but at least those would be coded against an interface that
> > the kernel itself specified, and can be made as generic as we choose to.
> > 
> > Not saying this is all great, but it might be a worthwhile compromise to
> > consider.
> 
> Finally getting back to this series...
> 
> 
> I'd definitely like to keep mapping the resident firmware using EFI runtime
> services because otherwise I'd have to duplicate a whole lot of tricky code
> to do the same thing via some other means (e.g. a device tree nodes that
> contains all mappings + callbacks) and I just don't see much value in that.
> 
> I'm happy to just drop the PSCI part though and replace that with a simple
> and somewhat generic "efi-rt" (or similar) cpuidle driver and make that one
> have similar requirements like I added for this RFC series and expose bunch
> of generic callbacks (that will just happen to resemble PSCI functions very
> much ;)) via a custom EFI table. That would keep PSCI out of all of this but
> come at the cost of an additional cpuidle driver.
> 
> I don't think that would open any flood gates for SoC-specific drivers since
> we could just point them to the generic one and tell them to use that one if
> they can't do PSCI for some reason.
> 
> 
> Now before I go off and prototype this: Would this approach be fine in
> general with you, Mark and Will?

tbh, if the "efi-rt" thing is just PSCI with a different conduit and that
conduit is properly documented, then I really don't see the point in keeping
it separate. However. I suspect that we probably all have slightly different
opinions here which isn't going to help you very much :(

Will

