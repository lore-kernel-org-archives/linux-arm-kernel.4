Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AE8606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sJGFsVOo;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UIyXcIMH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8q0lR6QsKstdpDF4gJX9VbdnKsOKt9hZucknTnB2NSs=; b=sJGFsVOogaG0T/cS4DVniXKf4U
	oKrC37UsxG98RFsj7m6btCMQPklBDdZtaGGuIEf4J1+sUiKbmZPegv4N6XLIevAlnkVVA/ZEIHFQQ
	CNR8+WaWdSNif3CGdpYTWsFjBnjXWbH9g0Ze0TKU7pme7JY+CFgoyRxE7DnK86BXHzeQO1jOziRN/
	9chJaDy1nXv8GAWYquntn5k4o/ed2z4tIw6SXf0GSQBFO4CISIOUZS8gE1PdodcYWjGYsqUpdCt1y
	YVec0BKre7Syz2fiqfcdJhcHdKNDpxlThbUg1Hc52QHTHMfVDsq4EObN5ACOxsgbx0TUFbsVaFfNx
	TrxJ8GVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXFbE-00000000fPX-3322;
	Sat, 28 Nov 2026 10:24:10 +0000
Received: from out-198.mta0.migadu.com ([2001:41d0:1004:224b::c6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXFbA-00000000fPA-3gaF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 10:24:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8q0lR6QsKstdpDF4gJX9VbdnKsOKt9hZucknTnB2NSs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795861441; v=1; x=1796466241;
 b=UIyXcIMHirwMRGp/vEVD83mNcrhFrdTx9F+RJHxs05fADXRAStojnrHdhFfQTTfJrbe/NpdA
 tZ0z/oCNjDUr5UDsOfu5rO+CYdlyXW58Be2mboCb/TixGa/Ry6u5tpj92mkTYMCQWeHP3JqktuC
 X7PdY8d2kBxKt/pmM98kpvO4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6eecf8be0ac8dcb1;
	Sat, 28 Nov 2026 10:24:01 +0000
X-Mizu-Trace-ID: 6eecf8be0ac8dcb1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c344fc3e3aso1773e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 02:23:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErG3Rggzr+zFoCNurYi7pIKtPO5uo4mjeww53hFLmRpVigdAOSicTvEu2hCxxlyl7eY36J4GaUINzKJhLH+N9BMU@lists.infradead.org
X-Gm-Message-State: APuU4Z/0CK6Dj6lOHuy4jOZ2pHeZ1zymF/jyJIqnR0mZkC3JCUgN+tH3
	u6bO+tqvURURpqW5vSqpXYEyFunQocsdhqv/ZYcUseIApx7e0vH/PK/3O6DhAIjtRxvXXTlB03u
	HKbObOlPE2urKqhpboreN6ZOgAKzzTClWrgcs0Uac
X-Received: by 2002:a05:6512:a84:b0:5c1:5bc5:f373 with SMTP id
 2adb3069b0e04-5c222dc93ccmr890373e87.15.1795861436887; Sat, 28 Nov 2026
 02:23:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261127212743.1139739-1-vdonnefort@google.com> <86se0lxpti.wl-maz@kernel.org>
In-Reply-To: <86se0lxpti.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 28 Nov 2026 10:23:20 +0000
X-Gmail-Original-Message-ID: <CA+EHjTy15GC3=c7MvQu7eKON1g-v8KFzYXruoTfWvoSdBOnMCA@mail.gmail.com>
X-Gm-Features: Aa3M54rBUeM9GDr14iZtDQNqhNurSw8bWhfxNqaGvkRf8d9q6kTODFktkvbCXtk
Message-ID: <CA+EHjTy15GC3=c7MvQu7eKON1g-v8KFzYXruoTfWvoSdBOnMCA@mail.gmail.com>
Subject: Re: [PATCH v1] KVM: arm64: Use CNTPCT_EL0 for hyp trace clock
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_022405_732331_600AEB54 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Sat, 28 Nov 2026 09:34:01 +0000, Marc Zyngier <maz@kernel.org> wrote:
> On Fri, 27 Nov 2026 21:27:43 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > trace_hyp_clock() reads the virtual counter (CNTVCT_EL0). Under nVHE
> > (and pKVM without hVHE), loading a guest with a non-zero offset applies
> > that offset to CNTVCT_EL0, corrupting the trace timestamps. Use
> > CNTPCT_EL0 instead.
>
> pKVM mandates CNTVOFF_EL2 being 0. Has that changed?

Not for non-protected VMs. flush_hyp_timer_state() zeroes CNTVOFF_EL2
only for a protected vCPU, and a non-protected VM in pKVM uses the
offset the host sets. Without hVHE, the hypervisor's CNTVCT_EL0 reads
then include that offset. I saw the trace timestamps jump on QEMU with
pKVM on a cortex-a57, running a non-protected guest.

Cheers,
/fuad

