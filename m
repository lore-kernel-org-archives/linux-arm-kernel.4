Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CF0606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jGAglT8n;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q6qmEAkk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sqeef6VWXCGPSprL2sUdbvrAz/Iy/oSXdyGiMisPWE4=; b=jGAglT8nUu5tjMZIU5cBWiOArS
	+QugnFBbTiI+OwlN0PEWk+3XuKz51An2U+A+dxJez3H+aj1z0StmKs1DAdQDmeQihDHv3D0pz4ogW
	yhMRV7fs4vNDSThDx8vx95lnHPG5EdWtuoGoMVI5GihXkSocP8DaKdqFZuV1iaXVD59Weqc90OeQB
	KvjTBpM3yK668JohqlStqy2jSxo1g7GW5NBP7urz+goRQQ9W3QkDsErp8LdSm8pF3d1StO1gFz6fq
	daZ8lvTOxKJeiEySJbQoqAOYhOrnNpr+zgPGqhFJF3fDrPv8bpCvE8IAxqcBQ6H++FNJQm7FTz0KW
	CNTKmHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrM4-00000001RxS-12jC;
	Mon, 16 Nov 2026 07:42:20 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrM1-00000001RtQ-0XSC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:42:18 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4boBAffMzoVHjAgWiSv2kJlP8mtRBwtsuJLv1o8lqGk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794814933; v=1; x=1795419733;
 b=Q6qmEAkk89m8fHB6W+5KQrNhPCSkFn/n4RBlfDQrEOJwL5O1LZMRjvNxhfK7zZM3SMAO3c/s
 hNEhIFX6/LY1mmLh8K3CsNoz3ObrNCGibPFfiU2ZpH/NH4J+ijQRwrlvu3hxbvXMAsy6gWL1pVL
 6sWQTN+X6ONGRHIwVNwRSGn4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 52cb570f7b3fa2bc;
	Mon, 16 Nov 2026 07:42:13 +0000
X-Mizu-Trace-ID: 52cb570f7b3fa2bc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be58ad9600so6412e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 23:42:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEAnKkGV4xOCjJL8mYuFn8/ehrCmy/9JWpQ97p6vZcz5+rZvN2QT+5Eer0HAtS9tuH8KTpmd81BZ5frvNyfJT+N@lists.infradead.org
X-Gm-Message-State: APuU4Z972UvaGOvc0fY+t+z2pQQv4dXPqieKlU7HP+a8Z5z0gTlDVgQx
	M18GZKpSdEo9xNAWfT4yrYbFKZB4IWRhzRexXvqqrt8sgoKGcyNwMPTQ/Hfnu5Ya/b3fB8UQsaC
	zjZA8bvjLfoahO4RxY/tVlrl33jyHKBAtHjq6985H
X-Received: by 2002:a05:6512:1244:b0:5c1:4bd2:df42 with SMTP id
 2adb3069b0e04-5c17e452300mr135874e87.12.1794814932262; Sun, 15 Nov 2026
 23:42:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261113081934.1715497-1-fuad.tabba@linux.dev> <87jymf8m1z.wl-maz@kernel.org>
In-Reply-To: <87jymf8m1z.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 07:41:35 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyhBd1rNqr2DV7kAdbtonEW8a+euJHMMsD-UsD9_-5S8g@mail.gmail.com>
X-Gm-Features: Aa3M54o6cnejirjhEwUOGDdCwRplzokz4vB083Z4FAIDONp5f_S3HfgryjrtL68
Message-ID: <CA+EHjTyhBd1rNqr2DV7kAdbtonEW8a+euJHMMsD-UsD9_-5S8g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Keep firmware Spectre-v4 mitigation on for
 protected guests
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, vdonnefort@google.com, ryan.roberts@arm.com, 
	qperret@google.com, steven.price@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_234217_317381_6A0B8A76 
X-CRM114-Status: GOOD (  27.50  )
X-Spam-Score: -2.8 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Sat, 14 Nov 2026 15:33:44 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
[...]
> > @@ -30,6 +31,8 @@
> >
> >  DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
> >
> > +static DEFINE_PER_CPU(bool, host_ssbd_disabled);
> > +
>
> Why do we need yet another set of per-CPU booleans to track the host
> state that is supposed to be stored in kvm_host_data? We already have
> a metric bazillion of flags for any odd state tracking, and I really
> can't see why this should be an exception.

I'll use a kvm_host_data flag in v2.

[...]
> > @@ -940,6 +943,17 @@ DEFINE_KVM_HOST_HCALL(int, __kvm_vcpu_run, struct kvm_vcpu __kern *, vcpu)
> >                          return ret;
> >                  }
> >
> > +                /*
> > +                 * Firmware Spectre-v4 mitigation can be advertised to a
> > +                 * protected guest as permanent. The host kernel runs with it
> > +                 * enabled, so nothing is restored on exit.
>
> I don't understand this. If the host is supposed to run with the
> mitigation enabled, how did we get here with the mitigation disabled?
> It's not like we can get here directly from userspace...
>
> So either the reasoning in the comment is wrong (and therefore needs
> fixing), or this is a buggy (malicious?) host that tries to trick the
> hypervisor (and then I question whether we should even try to continue
> running the guest).

It's the second. The host kernel enables the mitigation on every entry
from userspace, so only a misbehaving host gets here with it disabled.
I'll say so in the comment.

I had EL2 enable it again so that the NOT_REQUIRED it returns to the
guest holds whatever the host does, but failing the run does that too.
I'll do that in v2, like the SVCR check above.

[...]
> > @@ -1671,6 +1685,12 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
> >                  goto exit_skip_instr;
> >          }
> >
> > +        if (func_id == ARM_SMCCC_ARCH_WORKAROUND_2) {
> > +                /* Drop the hints, so that the firmware decodes the ID as EL2 did. */
> > +                cpu_reg(host_ctxt, 0) = func_id;
> > +                __this_cpu_write(host_ssbd_disabled, !lower_32_bits(cpu_reg(host_ctxt, 1)));
> > +        }
> > +
>
> This should be pushed into default_host_smc_handler() rather than left
> dangling here (it is pretty obvious that it has nothing to do with
> PSCI or FFA).

I put it there since that's where the function ID is decoded, but I'll
move it into default_host_smc_handler() and pass the ID in.

Cheers,
/fuad

