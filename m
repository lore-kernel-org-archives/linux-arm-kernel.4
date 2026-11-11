Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED084606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 18:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tssiNXpX;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JrbjSFrv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nFABM/SwyM5n9FbKHYal/oQliYZ3pyaRcZ9nUutqbLU=; b=tssiNXpXsVMXhxQYqBJtN3AT+L
	yeDS70udgbWNFtMF8qXLFvDQeKsQE8x0cEKTFC4HNZKvCnP0Jy2FCRBtlF9IK33kcwBcI3VKxpomk
	S/G973YWSVNOnGwKhsdHutp3/zXQ4tJTbIp3HJF97J7E6pundRct42LK8y2i4P16NW0NX0qsOd5S6
	P/4bkFHjyiStDsShGjQAeP1qIN6fX/z8J/OyjbIPDN7mH2z6QkpudUnoPAZJb/95QEdADKmMJueoD
	kk95SR8BP9PB0vwRKU7S5fu2iokkR9PFqQGJUU2Dx3f1mXHYzmk8O8XLjyx4zX1pylz5VoQNn9GOS
	NphF1BHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCim-00000007NFg-3vn1;
	Wed, 11 Nov 2026 18:06:56 +0000
Received: from out-169.mta0.migadu.com ([2001:41d0:1004:224b::a9] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRCij-00000007NFL-3Ped
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 18:06:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=nFABM/SwyM5n9FbKHYal/oQliYZ3pyaRcZ9nUutqbLU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794420411; v=1; x=1795025211;
 b=JrbjSFrvFjiSIqOjHe/kwt9pNguLVyi/YOteSfQioIvfhPlSKw2LTSIWSOUfE9fm5K2vX/FW
 jGFe+exbn2jcV3mwj8e36uROrWugdzMmz77lcw9fi13BKS6Qn9zZNBc569FaoYiE7Rsb/CQVZHG
 9onAHxN5e9C6PWecs2aCUHj8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 059c099c0865e01c;
	Wed, 11 Nov 2026 18:06:51 +0000
X-Mizu-Trace-ID: 059c099c0865e01c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso44e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 10:06:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHhCXWKLAJMqhQei0luh92t4b3Beo14uO9lofqpvl62CBZRu41Ri114+/bB/7323fPn2BKY/HGaY8rP/3yzPDmf@lists.infradead.org
X-Gm-Message-State: APuU4Z/nRNj/wIqASCiswKipJ1VeDPVcRg6Ip7gFBqF9HejdjE/pEu5w
	8l+iGS37yD9OKF9qz/7TPryIDGrEViEE9IpxRei5kN/OyTE1pn0rJS3RJNVQbH/QlzcL3cK4ylN
	BWaP+PEc2vXUHTG7KvE477WPu6PI6oXpTdHq/dz9k
X-Received: by 2002:a05:6512:3054:b0:5bf:f0fb:2c9c with SMTP id
 2adb3069b0e04-5c15d3f5907mr196823e87.5.1794420409621; Wed, 11 Nov 2026
 10:06:49 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
 <20261001135711.1640520-10-fuad.tabba@linux.dev> <5fa8a1fb-4e2c-4746-8a70-a47f387ef0d6@arm.com>
 <CA+EHjTyCcGPMte9=HuqyvCS7CCCt80Lc_JQuA+1e3ZE+3A0zqQ@mail.gmail.com> <c426f5a3-d161-476d-8911-99903ecf8e46@arm.com>
In-Reply-To: <c426f5a3-d161-476d-8911-99903ecf8e46@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 11 Nov 2026 18:06:12 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzJggL5gwBT=5+eF-30=W3rHnwtQoCguiqYZrnV-dhQNA@mail.gmail.com>
X-Gm-Features: AclHuK-obnEvFeK-oZDjiRcp3WhqMlDvWCrbcxoPgPML16ljc-27phGiA9oxoSw
Message-ID: <CA+EHjTzJggL5gwBT=5+eF-30=W3rHnwtQoCguiqYZrnV-dhQNA@mail.gmail.com>
Subject: Re: [PATCH v4 09/18] KVM: arm64: Implement HVC handling for protected
 guests at EL2
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_100654_274952_5B501843 
X-CRM114-Status: GOOD (  12.00  )
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

On Wed, 11 Nov 2026 at 17:50, Ryan Roberts <ryan.roberts@arm.com> wrote:
[...]
> > Yes, where the mitigation is the firmware one. The host can disable it
> > with an ARM_SMCCC_ARCH_WORKAROUND_2 call, which EL2 forwards, and EL2
> > doesn't enable it again before running the guest. With TF-A that's
> > only on a Cortex-A76 without SSBS, the only CPU it implements the
> > dynamic workaround for.
>
> If the mitigation is via SSBS but SSBS is not exposed to the guest, I'm guessing
> this is safe because the guest is expected to set SSBS=0 in this case?

Yes. A vCPU is reset with PSTATE.SSBS and SCTLR_EL1.DSSBS clear, so
the guest doesn't have to set it.

Cheers,
/fuad

