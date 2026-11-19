Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79638606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gOK67oHg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=All8TMmr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FSijPhhRa1sylue+Xngi69obQ3Cz7DJerakSbhJI/xQ=; b=gOK67oHgzFFvJJiueQmnlzxXlC
	1CWZCj9s3KnCHFFUDxnytIngSVj92vjSYOzaIDcNnyIYDeLibo1gXQ0ZpFlWBJ7DdmdiZZbRoW9Ds
	t1jg02BdhCIxd/+HXErBLz1DAEC+530Pes5t20baOpulvO48HEK8NttPM6NYNUUWD3AhcunxPveBV
	ghs6KANFGdKFYf5ywSfIoNiKdDa2+ZUWe85fHzVw1DeDp60UiMUzCOdo8K6qZ6WaHYbuQOfSlNXLZ
	7jtupUpd6KrqXxy6wUJ/rafSUTKJy0Fl2baX64H3/sJLJ0EKImpaz7KNTQvl8tTdUb+F4I3QKpREC
	J4zkd6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2v8-0000000CBzm-46uQ;
	Thu, 19 Nov 2026 14:15:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2v7-0000000CBzg-3IwK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:15:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FD6746699;
	Thu, 19 Nov 2026 14:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A869A1F000C6;
	Thu, 19 Nov 2026 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795097725;
	bh=FSijPhhRa1sylue+Xngi69obQ3Cz7DJerakSbhJI/xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=All8TMmr/Keh3K1xwi5Ldk1VYiZvjF+dSBPD0KJ9At1KNNTcbCCkj48CoYsBri23r
	 KjvbopJhKPAsqf5U/86rrOMEbem/XRpW5ezqU/R25L1udyNlJrhorZEs8RCpN9+9BV
	 wD+ZBBj5LWo5RqiTm1X8ly5n6QP1shllNCf9Rb44oJFGsp2dpp/x2Kx/thi6s3+kGV
	 Z0b6Xj1z1ts7jo7Fr0aXQJNvAGRezLhukj64iCoYcb9BsY9RXGx4Dow+uwpcfHzv0I
	 hq5PXnHUs+TO6gzYyNVzPkhk+2j/TDvLPTo7aZXggiPSn78Xp0KgT/DOUqUgHsgCaW
	 Tu31Dqhd9an5Q==
Date: Thu, 19 Nov 2026 14:15:19 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com,
	elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
	david@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
	kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
	kernel-team@meta.com
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261119-ruddy-honorable-bustard-ac2b4c@sudeepholla>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117170709.00002088@oss.qualcomm.com>
 <20261118-poetic-robust-raptor-bcff2b@sudeepholla>
 <20261118093203.000069f1@oss.qualcomm.com>
 <av3w1CbwYxFRPStZ@pluto>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <av3w1CbwYxFRPStZ@pluto>
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

On Wed, Nov 18, 2026 at 06:39:16PM +0000, Cristian Marussi wrote:
> On Wed, Nov 18, 2026 at 09:32:03AM -0800, Jonathan Cameron wrote:
> > On Wed, 18 Nov 2026 09:33:44 +0000
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> > 
> > > On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> > > > On Mon,  9 Nov 2026 09:11:46 +0000
> > > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > >   
> > > > > Hi all,
> > > > > 
> > > > > [TLDR Summary]
> > > > >  [V15 highlights]
> > > > >  - general cleanup and hardening driven by reviews
> > > > >  - improved TDCF access routines to minimize lost samples under load
> > > > >  - completed ABI docs
> > > > > 
> > > > >  [V16 TODO]
> > > > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > > > > 
> > > > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > > > > dedicated to System Telemetry.  
> > > > 
> > > > This is one from the family of issues you find when reviewing ones own
> > > > (well LLM generated) emulation, realizing it doesn't match the spec,
> > > > and yet works.
> > > > 
> > > > This works fine without the required SCMI protocol property in ACPI.
> > > > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > > > Platform Design Document. 111115A 1.0
> > > > 
> > > > Now, in here is an informative statement...
> > > > 
> > > > Protocols not listed using a property may not be enumerate by the operating system.
> > > > 
> > > > But they are... 
> > > >  
> > > 
> > > Correct, I intentionally left that out. I do have a patch that restricts it
> > > strictly to the listed property. However, I held off on pushing it because of
> > > an issue we saw on an internal test platform.
> > > 
> > > On that platform, the firmware advertised the protocol to the OSPM via the
> > > base protocol, even though it wasn't functional at all. Once they realized
> > > this, they simply dropped the entry from the ACPI SCMI device as a workaround
> > > instead of properly fixing the base protocol discovery. While understandable,
> > > relying on that workaround delays proper firmware fixes.
> > > 
> > > That is why I went with the non-mandatory "may not be" wording. I am happy to
> > > merge that restriction patch if a real production platform actually needs it,
> > > but until then, leaving it open helps catch and fix broken firmware
> > > implementations 😄.
> > 
> > You can't merge it safely as at a later date because chances are high
> > someone is relying on the current behavior and not presenting that
> > (currently pointless) package in ACPI for some protocol or other.
> > 
> > I'm fine with a permanent decision not to check this but I don't see it
> > as a thing that can ever change (except maybe now whilst there are not
> > that many platforms out there using it!)
> > 
> 
> Even though the change would be at the transport layer, given that it is
> NOT impacting the Base protocol, cant we anyway quirk it later on based on FW
> vendor/version as an extrema ratio so as to support anyway older FW
> leveraging the current behaviour ? (not ideal I agree...and I have to
> double check what changes could be needed in the quirk framework..)
> 

Equally good point. I am worried as Jonathan say what we many platforms
start to depend on current logic and end up skipping the ACPI property
in the firmware which can be problematic to address in the future.

Let me think about it so that we can address possible f/w bug issue as
well.

-- 
Regards,
Sudeep

