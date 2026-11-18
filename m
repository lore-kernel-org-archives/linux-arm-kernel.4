Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4EF60A2611
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=36v1ukzM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=NyAqW7IN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tPrZMxN6HNDViBgH4QPO+jnvPIWWDODS2KOm5lvzuzI=; b=36v1ukzMqyljBpDyrMHQ0iOzdn
	BppxpRRlejTeEZEd6dhyIq148+IJHyCNuuoCD1X08JAF4c/ewHFLGKpIIuNCDq5TDnP/gWfk7cAqN
	EdIK2MoI93fS8pZIH0tMJvKscb1/qOyvrXdKko78DIDaJR+3o/KgTw1NsE7P93t0sIOEivg0DRBIy
	bc4G+6HqslBvUeNqJQo8Lepjx78yasJui0RbUr8dpR9Ka6p7ypaFWPth+V6lXfH1NKR9nfrMNoG+F
	+ZT/ivWED6rXDvw7T6ziyh8IDTR0MUHw+k5kbz73K/fno/fmuDXrdA1aPrF1OUCXexAZXo5MiG9Nt
	gq0Ed/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkcm-0000000A11e-19nq;
	Wed, 18 Nov 2026 18:43:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkck-0000000A10w-1Cta
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:43:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97DBA1477;
	Wed, 18 Nov 2026 10:43:10 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 77F893F673;
	Wed, 18 Nov 2026 10:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795027393; bh=FoMcxbF+SEsG1nE2T7ocNvyh8bjhDBTZTst+coiAAFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NyAqW7INkZ1JifAMUjoZztv/g0S4trt6yB3JNIpJAl2Zg5STQixxbrwYl/P4VNaCv
	 m6V+bbtDakidQWGVItqMZZ0JedrdK8LPZ6d+2RpsXWr9tFWiDvVzcQ2FtrQ947qHF8
	 6hKmKKrVDkXPsuszcMqb9HlIcts5vjMmA4UR98+M=
Date: Wed, 18 Nov 2026 18:43:06 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 10/35] firmware: arm_scmi: Add Telemetry resources
 enumeration
Message-ID: <av3xuj6lcgvlXEOt@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261109091221.2532706-11-cristian.marussi@arm.com>
 <20261112100145.00000560@oss.qualcomm.com>
 <avYZ2t_GoT7BN2nU@pluto>
 <20261116133638.00006cc3@oss.qualcomm.com>
 <av1rTY1cZjRbxzD6@pluto>
 <20261118092623.00000cc4@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118092623.00000cc4@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_104314_418178_71CF07A9 
X-CRM114-Status: GOOD (  68.82  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 09:26:23AM -0800, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 09:09:33 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > On Mon, Nov 16, 2026 at 01:36:38PM -0800, Jonathan Cameron wrote:
> > > On Thu, 12 Nov 2026 19:56:10 +0000
> > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > >   
> > 
> > Hi,
> > 
> > > > On Thu, Nov 12, 2026 at 10:01:45AM -0800, Jonathan Cameron wrote:  
> > > > > On Mon,  9 Nov 2026 09:11:56 +0000
> > > > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > > > >     
> > > > > > Add basic Telemetry allocation and initialization routines, introducing and
> > > > > > wiring-up the logic needed to enumerate all the SCMI Telemetry resources
> > > > > > optionally using a lazy on-demand scheme: this approach factors in the
> > > > > > flexibility needed to minimize the amount of initialization work based on
> > > > > > the effective access pattern used by the upper layer ABI.
> > > > > > 
> > > > > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>    
> > > > > 
> > > > > Hi Cristian,
> > > > > 
> > > > > This stretches across the patch set but first elements related to it are
> > > > > in this patch.  How do we handle larger values of de_data_sz?
> > > > >     
> > > > 
> > > > We dont. This was somethig that was on my todo list initially, but then
> > > > I realized that there was NO FW-side plan to actually implement anything
> > > > larger than 64bit.  
> > > 
> > > Understood, some set of firmware that you have isn't doing this. I don't
> > > necessarily mind not supporting it initially but like the other features
> > > it is very useful to have an implementation to make sure it doesn't break
> > > the ABI. I don't want to go through a 'move to version 2 ABI if you want
> > > this feature' path.
> > >  
> > 
> > Agreed that it would be better if avoided.
> >  
> > > Let's just say I hit this for a reason. Whether that reason makes it into
> > > a production firmware is an open question at the moment.
> > > 
> > > FWIW I have both QEMU based emulation (I'm working through the process to be
> > > able to share that) and the changes to fit in via what I think is the
> > > cleanest ABI change. Kernel / userspace change below.
> > > I modified this from my original proposal to take into account the
> > > desire to add it later (even if to me it smells like papering over a bug
> > > rather than adding a feature!).  See below for what that required.
> > > Not only shmti is tested.  The LLM found bugs in it's own fast channel
> > > code, so take that with a pinch of salt!
> > >  
> > 
> > I skimmed through your patch and it is mostly in line with what I was
> > imagining (not even protyped though), i.e. in a nutshell
> > 
> >  - an ABI feature bit to add MUTIWORD support
> >  - a flag bit to activate this feature on all _READ IOCTLs at will
> >  - a repurpose of the pad field in scmi_tlm_sample
> > 
> > What I find awkward is the usage of pad as an index: that will expose
> > a lot of duplicate data since all DEs multi-words are now scattered
> > through a number of sample with the same ID and TS, and a bit cumbersome
> > to handle in userspace to reconstruct the multi-word value.
> > 
> > My non-tested-nor-prototyped idea was instead to repurpose the pad field
> > as a length, so as to pack all the multi-words payload as the trailing
> > part of a flexible array member (an extrnal array really being an ABI)
> > and use a single structure to read a complete DE.
> > 
> > In this case the problem would be to maintain backward compatibility
> > with the current scmi_tlm_de_sample.
> 
> Indeed, that's what drove the just using an index approach.
> 
> > 
> > At first I was thinking that we could simply introduce a new alternative
> > scmi_tlm_de_multi_sample structure that is used in place of the current
> > scmi_tlm_de_sample ONLY when feataure bits is available AND requested: so
> > userspace knows that when sets flag.MULTIWORD it has to use the
> > multi-word structure in input where pad is a length and there are multipe vals.
> > 
> > While this would work for all the bulk ops since they take a __u64 pointer
> > to a payload structure really (so it does NOT really matter what they are
> > carrying as long as it is consistent with the advertised feature bits and
> > request flag),  it CANNOT work for DE_READ where scmi_tlm_de_sample is
> > used directly...so a change in the current, not-merged, ABI would be
> > needed anyway....
> > 
> > Then...I thought that maybe we dont even need this...and this part could be
> > judged horrific maybe, so feel free to stop reading if your eyes starts
> > bleeding :P
> > 
> > Currently we have
> > 
> > struct scmi_tlm_de_sample {                                                      
> >         __u32 id;                                                                
> >         __u32 pad;                                                               
> >         __u64 tstamp;                                                            
> >         __u64 val;                                                               
> > };                     
> > 
> > with pad being unused and the whole structure that can be used alone
> > or packed into a container struct.
> > 
> > WHAT IF... when MULTIWORD feature is enabled AND requested we repurpose
> > the meaning NOT ONLY of <pad> but also of <val> and use this latter NOT
> > as a payload for a single value returned but as a pointer to an external
> > array of words counted by pad ?
> > 
> > The structure size remains the same, while its interpretation vary based
> > on the requested flag when such feature is available.
> > 
> > It may be a bit cumbersome still on userspace for bulk requests since
> > scmi_tlm_batch will contain a pointer to an array of possibly varied
> > sized items, so item_sz represents the common basic scmi_tlm_de_sample
> > size which in turn carries the sizing inside the repurposed <pad>
> > field inside for each single sample item
> 
> Are they variable sized, or indirections?   Today I think
> scmi_tlm_data_read() simply points to an array of scmi_tlm_de_sample.
> In this scheme it continues to do that but some of those then have
> pointers on to additional storage.  That's a more complex beast
> to manage. 
> 
> > 
> > ...so you can anyway check the provided user-input sizes it is just
> > scattered all over and as a consequence also the user provided data
> > would have to be a bit fragmented since 
> > 
> >  - batch points to an array of scmi_tlm_de_sample sized by items_sz
> >  - each sample in turn points to its array of values sized by <pad>
> I read this as implying they all do this including the small ones.
> 
> >  - you can really mix both kind of DEs in the same request: some
> >    can carry the single word value embedded in val, multiwords can
> >    point to teh <pad> sized external array.
> 
> But nope.  It is a grab bag of different types that happen to be
> the same length.
> 
> > 
> > ...mmm sort of start liking this hoorr...or I am missing something ?
> > 
> > ... O_o ... it would need a tad of documentation of course ...
> 
> Quite a bit!  And probably a helper library.
> 
> > 
> > If you have not fainted in despair, I (and some LLM) could prototype
> > something like this in one of the next series ... certainly not in V16.
> > 
> > ... thoughts ? insults ? :P
> 
> It's an option.  More compact than the index one, though overheads of
> allocations might undo that unless they tend to be many line DEs
> and does avoid duplication of the metadata and timestamp (if there) which
> are guaranteed to match in every line.  Give we are trending towards
> basically having this breaking ABI change (be it with an opt in)
> it maybe comes down to invasiveness of changes in userspace that would
> be needed to accommodate it.
> 
> Probably a case for a prototype and see what it looks like.
> 

I will protype this later on in the coming weeks/series and see how much
painful it is to support this schema with my test tool as a starter...

> Anyhow, I guess now we have two options on the table we can conclude
> it is 'probably' going to be a safe ABI extension to make in a follow
> up series.  Not ideal, but I'd rather this didn't substantially slow
> down the progress to getting to full feature set.
> 

Yes it does not seem anyway something that breaks backward compatibility
in one way or another by using ABIT features bits and flags.

...but I need to prototype something for my own peace of mind :D

Thanks,
Cristian

