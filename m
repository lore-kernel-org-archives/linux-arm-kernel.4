Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E593606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T99OZgll;
	dkim=pass (2048-bit key) header.d=pereq.eu header.i=@pereq.eu header.a=rsa-sha256 header.s=google header.b=RcGnv2fO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vz6xI/WxixrEpdd3ywwOb3jpy1gOGMCFJ8JE8A5AwCg=; b=T99OZgllZX8wWkGU/oWovS4PvX
	v4XnhX4iJ6nvTA8sWe+xFqKgqpUex7EVYpVV1SzfWMZclHZqbR4MPvJQ94hTIWio/oSRUV/+GAKss
	b86dNRwJAfS7gwBvRycWS6DvBC6DyTYhvKTZQNpCmRKzEigM1suYhgPXo53UyxMC74MTeU1oaGOUy
	fx0SlWmZ/ZXFdUmWa9H5yh2lX7fyB5PE3fUMiGbx8mDkTXa5NNZ15MkTwG+uYY8t2UYKYvTzSSoxJ
	xApXDb5GaCPfVy8Slibpfy8A9BaAiryCzj65Mf3rwOZhsPupA91nM1xlLrBnmI2UmCv3MJvY99l5J
	h4SnQsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Ms-00000009IMy-0p3W;
	Wed, 25 Nov 2026 09:32:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9Mq-00000009IMC-1WZC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 09:32:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so56428305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 01:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pereq.eu; s=google; t=1795599162; x=1796203962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vz6xI/WxixrEpdd3ywwOb3jpy1gOGMCFJ8JE8A5AwCg=;
        b=RcGnv2fOjMgF9Wtf4BLkXRAt9OwoVPnWcSlx7oY+93xrWGl4ufCpkuAvYOymV3PLh3
         Xl4WHlwmbpD9wru03pVnk+WyZ29qHmSISvBK05tVg6dBF58aviJ8TuKmLYzJgIgaRKjY
         lgC/ciCkqzwfzdf9q2TMO2eY/FhHu2TnNQfrm/ScLLf5CVXz98pdFQ+Qh3/KCnjE0/5G
         ZogOJTvp46a3Ew3UDoDXZkBRUSEifvRaKGOBqOmtLPCOpEL4MjrL+kI6bnYPQe6F27+v
         r7YmesrmeGa1q3i27EBuToiznb4M5tyOt+u0+s60chdmdw1xlLNlCPJ0a0bB1Pd+U9Js
         PFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795599162; x=1796203962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz6xI/WxixrEpdd3ywwOb3jpy1gOGMCFJ8JE8A5AwCg=;
        b=nDDW86DazZ8nVwa0DbcSwUn1gMWgpR0CloffFOd37dch87FgnSP/0aHLY8bzdhCajB
         1io2EByBhpUbLwNUa3rfXo+KSF1ty8DSSfvdDjqFdpY2+LfN/Zh9HYjWTzpI7osGskE/
         498xZGdJN+mfzmIQFYEagWI0ZyOhLx89XDZTM0T+Ei5o3AymxIZNvZYOtpepnWua8LCT
         Vr+dQTPNSMVKfM8cscHXRxbFVeTwgvrV04a6dGiGg1ty6kURxggkrjMKB1pGnh3Zs7+/
         CPh3Ae8dPcrLDGmH2t2HYDQWGUuIf3hMmfqOb4vi1Up4qwgXmFY1GbGeQbCBLOp2Mq62
         rTWA==
X-Forwarded-Encrypted: i=1; AL+hErFVwpUyKm6X8UYTp3e2hfWx+BRgCYPRul31k/qfPUh9hThoZJpzXSP39bUDLtEasumKjjESbCb02NML42hQz67X@lists.infradead.org
X-Gm-Message-State: APuU4Z8TdBXXFsiItdYOe4N9hW5Ei03n1YQHskIoPk8GnnK0r8nRcbMM
	iKULwRWxBMUtQNsBq3nEP+zfWu1nbgwqVIjI4tDmhr9dOXcs1yN1k7U0rjHMS102OAI=
X-Gm-Gg: AZFdTZcBXCy5trXBaX+7D34YUKzw+QH9FZ02VJlipa3rE4WNoMagjZS+uYrv3/IHG0v
	zv4mrU/14VtxmKEpQwb+H0/rQGgxClyXV+D0DhbExQrgmiojaitrVj3aLuHR6ExMdVUivAfimCo
	k4KnWGMiat9rIp5ETVvePnQPAT0MGEqhZP7Hu52pw9lZWyXIE/XH3G2r951SlfwOucZ88tCyfp1
	5QPyfL/1/99d9AzIk7A50woiLq8qjsZHx/ZITjHXLK/k3NLIjiZUzMQcJH+AThB8FAnZio+gVqa
	oXCIC7Da6lS4fjuPr9vVfBrI9jHY+hBzschsxJfHUYfG5S0RRfcxdZUDjw9RztTaDo9zwyRFgpc
	TNijn8pVKY7rCAcKStu+PyUjHIvfco/wPbVCX75aPuhJyu2AhlsBDFnqTXpc9cURFuY2+FQMMM0
	iktQrZp8DT7SuLUpRsazf2wA4ed0/3OEUnom+c0BT9ZowGHDwnl3ROeLooHG0Uva44o4DxpPtQp
	tS6KMKoKbPtm7SZGTBlIBtIBGqUNLiRs0HBNPfP7G1CDgNbXkvDqRAnG8Nvn+S1+gPjNeVudOUj
	K5YnS48TxgwrkSmSlpU=
X-Received: by 2002:a05:600c:1c28:b0:4bb:867b:f0f0 with SMTP id 5b1f17b1804b1-4bb88810708mr406437605e9.15.1795599162309;
        Wed, 25 Nov 2026 01:32:42 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm32122755e9.3.2026.11.25.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:32:41 -0800 (PST)
Date: Wed, 25 Nov 2026 12:32:38 +0300
From: Dan Carpenter <dan@pereq.eu>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <c.dall@virtualopensystems.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Sebastian Ott <sebott@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	James Morse <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 2/8] KVM: arm64: Reset SP_EL1, ELR_EL1 and SPSR_EL1
 when resetting a vcpu
Message-ID: <awarNqNt6Kec5G0M@stanley.mountain>
References: <20261125-double_exception-v2-0-224689d8a764@pereq.eu>
 <20261125-double_exception-v2-2-224689d8a764@pereq.eu>
 <0c7c59df-69cd-40fe-830f-60c0f3cedafa@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c7c59df-69cd-40fe-830f-60c0f3cedafa@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_013244_427800_0069B948 
X-CRM114-Status: GOOD (  23.27  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 25, 2026 at 09:08:36AM +0000, Suzuki K Poulose wrote:
> On 25/11/2026 06:56, Dan Carpenter wrote:
> > Resetting a vcpu keeps the old values of SP_EL1, ELR_EL1 and SPSR_EL1.
> > Commit e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
> > changed the reset to only clear the general purpose registers, SP, PC
> > and PSTATE, and later commits moved these three registers to the system
> > register array without a reset value.  Commit 85d703746154 ("KVM: arm64:
> > Fully zero the vcpu state on reset") fixed the FP registers and the
> > 32-bit SPSRs the same commit missed, but not these three.
> > 
> > The impact is that the guest that boots next can read the previous
> > kernel's stack pointer and exception return address.  KVM_GET_ONE_REG
> > also returns the old values to userspace, and a rebooted VM doesn't
> > start in the same state as a new one.
> > 
> > Zero them in kvm_reset_vcpu().
> > 
> > Fixes: e47c2055c68e ("KVM: arm64: Make struct kvm_regs userspace-only")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Dan Carpenter <dan@pereq.eu>
> > ---
> >   arch/arm64/kvm/reset.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
> > index 26081d273408..9c1b42890c96 100644
> > --- a/arch/arm64/kvm/reset.c
> > +++ b/arch/arm64/kvm/reset.c
> > @@ -199,6 +199,9 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
> >   	/* Reset core registers */
> >   	kvm_reset_vcpu_core(vcpu);
> > +	__vcpu_assign_sys_reg(vcpu, SP_EL1, 0);
> > +	__vcpu_assign_sys_reg(vcpu, ELR_EL1, 0);
> > +	__vcpu_assign_sys_reg(vcpu, SPSR_EL1, 0);
> 
> nit: Please could we move these into kvm_reset_vcpu_core() where we
> reset other registers ?

Will do, thanks!

regards,
dan carpenter


