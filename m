Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832F7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 19:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uFuoVQEf;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LPH12Rmm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CHVKomnHyMaBE4qRz2ed+npw+rJDBubPaLp8NV9yPnI=; b=uFuoVQEfhX8wuRBxxgLv+IRhy5
	WAVJReytRAY0FddHK7YnipjOs5ampxbXUdvN15lj9RyOd2XCuIoMTVmzNHJKrEGibg7WAngN7SSk+
	/RZPF/6EIwUq2EcxJ00TQx/EUX57RVMe6kiL6K6gsRsT1ZcpQJ6P/pcZRZ3Iu078b/TpIn867W4io
	kdiVy/hR4DEF5IhzJ5X4Gmzjp97apP2cf7lyzlPR5+S9JtORRZb8HfWagK3BXKkU38n75/+EJTbaA
	wGsmyBJvKiIUw0I/QdV0AtEXMMg6o136yq5a9N8HoJJLhYh5Mrdf63/Ei1IfZMRAEo7YtosLvSFUQ
	0NJiCXlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDAy-00000001dOf-2q19;
	Sun, 22 Nov 2026 19:24:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDAx-00000001dOV-197Z
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 19:24:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 84F7E4053E;
	Sun, 22 Nov 2026 19:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEBFB1F000C4;
	Sun, 22 Nov 2026 19:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795375474;
	bh=CHVKomnHyMaBE4qRz2ed+npw+rJDBubPaLp8NV9yPnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPH12Rmmk43u6G72a1xsTOyFqx4FmQo/J1sXM6p1VUt0+QwzsvOmf3/URw0RwATFU
	 s3dF+dISsoR/pT9ianFbvC9OkQvpt5sn/JplpcMPhz5PTwupctkjs0GYeYyvsMFLkn
	 Zvqm5UfZ+aEYJPD+sZTHqySThVTUdXzchRCsgAlxGykPzhmhWMRYvNwXRa0pGLXHRt
	 H8+e61mFmXvo12u011y8P+uK1IKBpODWJIOImjp1CTKgiJnm2sm0/BooO5ko1BUhNW
	 EeKKNrKvzWaWhIpiSCCzJLcoeh8hD/iUQeIvCM2M60IHiEnPikXHYP+wYAVv7OJBYd
	 qs7YqnWQIKXZg==
Date: Sun, 22 Nov 2026 19:24:29 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jithu Joseph <jithu.joseph@oss.qualcomm.com>
Cc: Ahmed Azeem <ahmed.azeem@arm.com>, linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Divin Raj <divin.raj@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Ashok Raj <ashok.raj@oss.qualcomm.com>, punita@qti.qualcomm.com,
	jonathan.cameron@oss.qualcomm.com
Subject: Re: [PATCH RFC 0/4] firmware: arm: Add Platform Fault Detection
 Interface support
Message-ID: <20261122-thundering-effective-chimera-bebbc7@sudeepholla>
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
 <13d32bf7-7f74-4dc5-a875-671167149df9@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13d32bf7-7f74-4dc5-a875-671167149df9@oss.qualcomm.com>
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

On Fri, Nov 20, 2026 at 04:44:15PM -0800, Jithu Joseph wrote:
> On 11/19/2026 7:36 AM, Ahmed Azeem wrote:
> > Hi all,
> > 
> > This series proposes an arm64 driver for the Arm Platform Fault
> > Detection
> > Interface (PFDI), providing a common Linux interface for privileged
> > userspace to discover and invoke firmware diagnostics.
> > 
> > We are posting this series as an RFC to seek community feedback on both
> > the proposed Linux interface and the underlying firmware specification
> > before the specification is finalized. This series and its validation
> > use
> > the PFDI 1.0 ALP0 specification [1]. The current public revision is PFDI
> > 1.0 BET0 [2]. Feedback on the software integration will help identify
> > any
> > changes needed to align an upstream implementation with the evolving
> > specification.
> >
>  
> ...
> 
> > 
> > I would appreciate feedback on the specification's suitability for Linux
> > integration, the proposed per-CPU ioctl ABI, the worker and hotplug
> > model,
> > and whether this belongs under drivers/firmware. In particular, is this
> > the right scope for a common PFDI interface, and should error injection
> > be exposed separately from normal diagnostic operations?
> > 
> 
> Thanks for the RFC
> 
> I haven't read through the specs or code in great detail, but I thought I
> would send in my initial thoughts.
> 
> Most of it comes from my experience developing/up-streaming a similar
> feature in my prior job at Intel called In Field Scan [1] / [2].
> 

Good to know, you feedback will be much appreciated.

> I think creating per-cpu threads just for this feature might be an overkill
> on a system with large core-counts. I think an alternate approach like below
> might work for this.

Agreed.

> 
> 1. Drop the per-CPU kthreads and the cpuhp state; run each request on the
> target CPU when it arrives ... something like cpus_read_lock();
> if (!cpu_online(cpu)
>         ret = -ENODEV;
> else
>         ret = work_on_cpu(cpu, pfdi_op_fn, &req);   /* or smp_call_on_cpu() */
>  cpus_read_unlock();
>

Yes much simpler.

> (IFS used an alternate cpu stopper mechanism as it had the additional
> responsibility of synchronizing sibling threads and related timing etc ...
> it might not be needed here )
>

Ah ok, thanks for the info.

-- 
Regards,
Sudeep

