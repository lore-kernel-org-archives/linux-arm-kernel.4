Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA34606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d/CPTk1m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oB2tNkd8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j29SAb8EvttOzVITE2CaOHnF65j/VwFfLdLmsnjzJTw=; b=d/CPTk1muZsCb2aLQTCsG/Do54
	ksh06F3h1HgdqvFYGF6NBQXoQgF+BW5hU6cm++x1ILFYRJEhIhSxYdHtcR6sq3VZLCXByqAcYIxjR
	hIYB4Y0eOFBq7cOZ7NxX8ttWSnqdAd/LSGO648/5e+RHATiR3zHrzdn6wHzKPeCuwd/x3h2VdL6qc
	u1ZrK3EAivLfwnZdn8g0Egw5ImKWNiNzf+q+gSH+nSRL8HFwCXjLKdZAW7ZLYPndC7DHGdrpyOV1j
	EqwPATXHN3MDv4d6n9tpXxSgwBvQpmrF3fcHsoWY/ZosPR+WZH4fT6+Mv4ikt38IxwfdPOCYMeTUp
	tCy7wE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4fY-0000000CaCR-08zD;
	Thu, 19 Nov 2026 16:07:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4fW-0000000CaCJ-3CQN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:07:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3148140A6D;
	Thu, 19 Nov 2026 16:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B0F1F000C6;
	Thu, 19 Nov 2026 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795104446;
	bh=j29SAb8EvttOzVITE2CaOHnF65j/VwFfLdLmsnjzJTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oB2tNkd81qDgc1xAqwbzSPP9GlHDuIuGyCMbpR1kMGA56iCQrX6lOWXZVfdedVMBA
	 MGOZKVIdhJEyeVEOBmvrRQaV9sGvCcobHzbr3g0a3ckDYo9Vx1pm/NqPXtISiYZF1q
	 JDCMd3tQi9adV4gCUn8XJqUs/QWjV1EfxeicqHFGML9uIprYVaZ1P4klWCB7Vy+AGt
	 3XfVCHdOsLxAjOge6fm1uj+6pyHpE3DQjaC86HtKH2w2+AGFczRMhzGNPvD7w6DO1c
	 imNUk4pg+gkw2HzBgQsbGIOgHNSE+5jYi6NF8MUGqKHA02tFQFKyOelfYuPuQGaybX
	 1COIfJEZalpLw==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.ams.internal (Postfix) with ESMTP id DEB88198003A;
	Thu, 19 Nov 2026 11:07:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 19 Nov 2026 11:07:23 -0500
X-ME-Sender: <xms:uR7_ajFv6OL4CpdUy_FIy296c2g6Re8mydHWaQMZYo-UTWtQlOdIkg>
    <xme:uR7_agwldovTu_dW7dvu_TgABclj-p_lLDYPooPlaOZjjEC5F4-vKi6lwLP7u6_s-
    l7eXRGgTp6cr2yQ9ohbunWkV10PjTrvTRWKYEH5G0T2M-VEfxWXAy3r>
X-ME-Received: <xmr:uR7_aqnRZOo4M5bsuoIgfqR-x9kby_P24P-Vz8sQ7wpIsA7dRMfY9PDgYmE>
X-ME-Proxy-Cause: dmFkZTFm0lYATStNIOABOpxqkau+yCPNey2OosqNHPZKxhPtD7wvr6Y76D+MC68PZNdkj6
    m1BZqkcynDzYwqcq5z5jlBzCaWzMrQz017P5oQLszBw3cLuuKBmyUv7gqQ2Z9E4syY/uMl
    96uoo9DAlI0Iq2RxKMGkHrqrm930MfQ3yqN/DaYUgc+eNUiq3dC2rjWQDDBdsPZExWmZzr
    bckN1JLS1Kg65dVfO0Cnjw2KVLenDCDZDgoktI0KDtChzk5mLkg9P32K+luEoP15tLd6y7
    7iXRLpOWscCnZ9CodeEdi9uC6LTfqsfeKkED8QRuYp1GBqE7N1NZ6IVzzSQLBjGlxSaAFB
    58uJaeeWvApciGPkEMLCvrNPjKEjPH0S8/42lRh/j8S3dkrofW7lCeGpvWVHtVrnY5gtmz
    n4UmZ7CfdaUdvhtzu+l7g0UwHMyxOQBo6nYUm+uaiZQynm/TZmCg1ih7vCSAJBdKQKRa5R
    4zeTO8IMaWSK1HDO4QqgCT+U5pZUwGkvxmFAleXqtgBsznaBiDsXAu0OV5u/UqCkC5TjZq
    v8kaboU/PUMM8hF+1GJwkzqwn9aMaT9AhHZctt1NWQEFHPUZm9vuf6WePlZJaqoKBqkT1X
    U80O3pGpklnnfN/0vjOnAN4146Dg1nXgrVARagvCWcKj9OxURiKZr1+P+cEiFk1VBNlvJM
    9XJBnEc5wpcKwOcYn/13kVJpfuFa8O8R1IuLhJyyGk4BkiRFhw5zx3yfKPdc/aFiZHlkuU
    ptvog1bcCv4E83NeS9Z56mvtZTM5w6IyFZpU5E42Jsa5MIUsHUwGQDEG2wdcinE+UFNwl6
    CIgA2AEQ/hW8UN0+aS0roo9ghyr0XEg3n9rszFllxxWqqOheBIC6dDOUqkrEITHndl+nbq
    exewjqPxiHT89JrhkqDt5mzpQJAVUr//4Xpyv7zKzz1T2wo/x2HXrziPxfFTLRokj6ey4j
    fNXdEtCq8RCIWl2MAyKxONS+mTRv9HToEnIxAopHDK2F3wUNKos
X-ME-Proxy: <xmx:uR7_avBxT01Fr2KvUXBPZShEfjk7JAjet3So9ofYaJ8k7YYadIqLiA>
    <xmx:uR7_atKbKGz-MkHgvKG3QK7FaEprVA66N0giFGKlKEAKN597BMnnMA>
    <xmx:uR7_aqwLqmA3FoQyeN1RNMrm40PfZjg4M1M3qc0bSMXX0qXly9-Y-Q>
    <xmx:uR7_apxlNUCSujTF36IPlGoJtZdUPh_UtThzcv_Ue6I97Brc0qxvPg>
    <xmx:uR7_ak0S6AlojHFO-lqz-cdlChB1dubIE_pcKDwxDq8_tU5Lb_KB1J8w>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 11:07:20 -0500 (EST)
Date: Thu, 19 Nov 2026 16:07:19 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
Message-ID: <av8bByU93_nCbPqE@shutemov.name>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <58a4c350-539d-49ca-826f-d19563895a29@huawei.com>
 <17149b32-6b9c-4364-b664-5789f0633e9d@huawei.com>
 <57757469-2545-4fc6-a7be-ccc133555052@arm.com>
 <38d04e8b-2f31-4616-8a8e-2747c7ce114d@huawei.com>
 <d4bb2979-4bc2-436c-8f4a-c9a5decea900@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4bb2979-4bc2-436c-8f4a-c9a5decea900@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, Jinjie Ruan <ruanjinjie@huawei.com>, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org, lpieralisi@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 02:50:50PM +0000, Vladimir Murzin wrote:
> Any chance you can attach debugger or collect traces so we know what those
> CPUs are doing?

I think they are idle with SDEI masked when the broadcast lands, and
the firmware leaves them unable to take interrupts.

A CPU entering a power-down idle state masks SDEI from the cpu_pm
notifier. If event 0 lands on it while it is masked, TF-A's
handle_masked_trigger() returns for event 0 without EOI:

    CPU A                           CPU B (power-down idle)
                                    cpu_pm_enter()
                                      sdei_mask_local_cpu()
    sdei_nmi_raise_backtrace()
      SDEI_EVENT_SIGNAL(0, CPU B)
                                    EL3: sdei_intr_handler()
                                      acknowledge the SGI
                                      handle_masked_trigger()
                                        // event 0: return, no EOI
                                    cpu_pm_exit()
                                      sdei_unmask_local_cpu()

The SGI stays active, so CPU B runs at the SDEI priority from then on:
no Non-secure interrupts and no more event 0. Other CPUs then hang in
csd_lock_wait() on their next synchronous cross-call to it.

I reproduced it on QEMU with TF-A v2.15 minus the check described below.

After event 0 lands on a masked CPU, ICC_RPR_EL1 there reads 0 and stays
0 after SDEI_PE_UNMASK, and RCU reports "1-...!: ... idle=c078/0/0x0 ...
(false positive?)" as in Jinjie's rc3 log. With an EOI added on that
path, the same test passes.

That path has been in TF-A since the SDEI dispatcher was added and is
still in master. TF-A v2.13 made SDEI_EVENT_SIGNAL refuse a masked
target, which leaves only a race with a target that masks after the
check.

A fix is under review:

  https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55414

Jinjie, what is your firmware based on?

Two checks would confirm it:

  - does dmesg show "SDEI_EVENT_SIGNAL to CPU N failed" after the
    sysrq-l? None means the firmware accepted the signals to masked
    CPUs;

  - does the broadcast work with cpuidle.off=1? Without power-down idle
    nothing masks SDEI, so all CPUs should answer.

Ways out I see:

  - Firmware: end the interrupt on that path, or keep event 0 pending
    until unmask as 55414 does. That is the real fix, but deployed
    firmware will not have it for a while.

  - Kernel: never signal a CPU that has SDEI masked. The signalling CPU
    and the cpu_pm notifier can handshake: the sender marks the target
    and IPIs it instead if it is already masked, and the notifier
    refuses the power-down state while a signal is in flight. SDEI keeps
    serving every running CPU, and the race goes away whatever the
    firmware does. It needs a hook in arm_sdei.c.

  - Kernel: send the IPI first and SDEI only to the CPUs that do not
    answer, as smp_send_stop() does. Simple, but then SDEI runs only
    when a CPU is really stuck, and a problem like this one stays hidden
    until the day it is needed.

  - Kernel: use the NMI IPI when there is one, as you suggested. That
    takes SDEI out of the picture where FEAT_NMI or pseudo-NMI is in use,
    but not on machines without them, which are the ones SDEI is for.

  - A switch to turn SDEI NMI off, like Jinjie's patch, as an escape
    hatch whichever way this goes.

Any comments?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

