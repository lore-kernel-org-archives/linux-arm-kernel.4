Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC8B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eApru8Ac;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FRR3vDb3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=D44eleHLuJyjN6DHxxZnS6xNAMu1xhOqNbQfUqInx60=; b=eApru8AcTlP3vpJ9eyEsROynw8
	GMuAzBmMz6Wx1bbQSASCU/Qs3wMS9YKb5NM8vrpFJBNAfQT1QqLMD0VvpmgHaeyX1Nc3cOz8myTqs
	eUTIhp+lKMs7yfhw10nuLfG4GoS/9h57dJf7KRX96WKgiv5cHY2oIKwsOkNBYlcU7Hz3u1H5OLtfr
	89xJceoGVMdhQ/62K/PzullI6ZXBTiW6SJrnQ6l2+w+zaS4YttPdfPjHITOKYEy5k6N5Qgkfj212H
	I21yVfVv1rc9oiGdG6EYody+3VHlne39E51uTSftha3edRJke7crynAp+rQX19AIpOi0TL4pujpMb
	/sTpJpIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkZA-0000000A0Kv-3TUR;
	Wed, 18 Nov 2026 18:39:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkZ8-0000000A0KB-1Lu7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:39:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB3F71477;
	Wed, 18 Nov 2026 10:39:23 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6921E3F673;
	Wed, 18 Nov 2026 10:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795027166; bh=b9vWe5L5qO916p8NmyWR01efXGtOjiyiUcgpP0QJEtk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRR3vDb3GSkepgLG3AAzkS+1kPr35nFe6nJJyxRkX0CieGAiPFkYLX0xc2n1x5EXT
	 67TN8mLY2T6a9mGS1e+KmBwuUossBj1AwcJtiOD0F2OhSWg3KWPZBLdNB6+DwbVp93
	 ok8WUT0svLaRvyAblfG5JWaSDM6iB8HFzT7B7n5c=
Date: Wed, 18 Nov 2026 18:39:16 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Message-ID: <av3w1CbwYxFRPStZ@pluto>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
 <20261117170709.00002088@oss.qualcomm.com>
 <20261118-poetic-robust-raptor-bcff2b@sudeepholla>
 <20261118093203.000069f1@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261118093203.000069f1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103930_467106_C65EF854 
X-CRM114-Status: GOOD (  28.93  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 09:32:03AM -0800, Jonathan Cameron wrote:
> On Wed, 18 Nov 2026 09:33:44 +0000
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > On Tue, Nov 17, 2026 at 05:07:09PM -0800, Jonathan Cameron wrote:
> > > On Mon,  9 Nov 2026 09:11:46 +0000
> > > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > >   
> > > > Hi all,
> > > > 
> > > > [TLDR Summary]
> > > >  [V15 highlights]
> > > >  - general cleanup and hardening driven by reviews
> > > >  - improved TDCF access routines to minimize lost samples under load
> > > >  - completed ABI docs
> > > > 
> > > >  [V16 TODO]
> > > >   - address any remaining V15 outstanding Sashiko/reviewers issues
> > > > 
> > > > The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> > > > dedicated to System Telemetry.  
> > > 
> > > This is one from the family of issues you find when reviewing ones own
> > > (well LLM generated) emulation, realizing it doesn't match the spec,
> > > and yet works.
> > > 
> > > This works fine without the required SCMI protocol property in ACPI.
> > > 2.2.2 of ACPI for System Control and Management Interface 1.0
> > > Platform Design Document. 111115A 1.0
> > > 
> > > Now, in here is an informative statement...
> > > 
> > > Protocols not listed using a property may not be enumerate by the operating system.
> > > 
> > > But they are... 
> > >  
> > 
> > Correct, I intentionally left that out. I do have a patch that restricts it
> > strictly to the listed property. However, I held off on pushing it because of
> > an issue we saw on an internal test platform.
> > 
> > On that platform, the firmware advertised the protocol to the OSPM via the
> > base protocol, even though it wasn't functional at all. Once they realized
> > this, they simply dropped the entry from the ACPI SCMI device as a workaround
> > instead of properly fixing the base protocol discovery. While understandable,
> > relying on that workaround delays proper firmware fixes.
> > 
> > That is why I went with the non-mandatory "may not be" wording. I am happy to
> > merge that restriction patch if a real production platform actually needs it,
> > but until then, leaving it open helps catch and fix broken firmware
> > implementations 😄.
> 
> You can't merge it safely as at a later date because chances are high
> someone is relying on the current behavior and not presenting that
> (currently pointless) package in ACPI for some protocol or other.
> 
> I'm fine with a permanent decision not to check this but I don't see it
> as a thing that can ever change (except maybe now whilst there are not
> that many platforms out there using it!)
> 

Even though the change would be at the transport layer, given that it is
NOT impacting the Base protocol, cant we anyway quirk it later on based on FW
vendor/version as an extrema ratio so as to support anyway older FW
leveraging the current behaviour ? (not ideal I agree...and I have to
double check what changes could be needed in the quirk framework..)

Thanks,
Cristian

