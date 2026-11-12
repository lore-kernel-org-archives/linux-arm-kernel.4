Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B126606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lvNC38JL;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BFG0AX8w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=y4NWcGpyLAF/FiolKWe6/Gbz2ERucyrW993TXlYX5t8=; b=lvNC38JLhAkWkYPX3orVDevs/E
	SZ6tW3KhIgYNYyZDTaYOTKQsMSQ9Yf/vOf9HZ3T9ZaY+o3woanmBatQkCsz2iULfnfWd5vip7c8cr
	4yMMY2t5WmHvBoNSkrGzJZVYo092twJ9QKRkpHImobiACxQ3HW2HRkEiGKRF0yAAiKur/eWkhdB2+
	y/ALXsfipUKZGgzjxA7sBm4TM6ZDazrHpvoY6LGl+DHATm2IRdoH/mcVv7Kl0WBvmeb9Nozt+z0Vx
	AkZMXGf9sMtTip+jIG3tLXPoc33TT4VoeX4Bq7RLh59Di6w6aPCu0fJLfpl5fSR8viIie+h2Yu/16
	qw6iyZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUv2-0000000A4s7-1MjR;
	Thu, 12 Nov 2026 13:32:48 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUuz-0000000A4rE-2Ydv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:32:46 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so33345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 05:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794490362; x=1795095162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y4NWcGpyLAF/FiolKWe6/Gbz2ERucyrW993TXlYX5t8=;
        b=BFG0AX8wkuVCN4fXrGLIscUXdv8Qh/ZlAuYCavyp5P2pH+YwUMy2iH5jpHto0EimoK
         Wxbk+DRPxrqMQ4V7G5dd+s7z4zejCSchA3SZRQAjjD7DpPDlR2OGvuMaq/mcfExbais6
         stb72dUqGsTOxvLzwOGdiloPuMD7b50gNSD+Ocsi30DZGVPoQ3C5LA5Fa+YSCkpwBPIq
         STc/lTrkaRm5oilBBxa4b75HqVn1YVZuAUdsqeQH/a/tAsmhgosBeDUYEKfvvYIqaf7X
         /SZ4deZ14H0ozvUuyeKnJb3uJCQIrKOCZgddVzp3AUAJoUdqSteIZnL4jcUVJoLrEvyA
         YewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490362; x=1795095162;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4NWcGpyLAF/FiolKWe6/Gbz2ERucyrW993TXlYX5t8=;
        b=akYpNyNI6eIa6LdI/FNMKoiygRJbpIoHIbnkKF/Y92jD2k36g17exZjoESnucvAbJq
         2q4wwW2p54HZHq/yIxTSzn/e8QPklNtTjl9e94xawLDlWol94ATsAHrv6bcN8JqvNzos
         r3l4p4QKxzeIiZQ1BaW/WLBS3LymWTkNWHoLWb68Y6pfQkFEHFsrOsRk29lg8ge3qAQ5
         gxdE/C1LxXBHqyY3xfpjqzRZ8FWe6RMmbeditywYwG8gACpUUVBBM4/YF/wdhAPIu+Lu
         oY9AKTr7oJHTeNF0zu33ArVEkbAvwhVLXU3ZfbCRIA2G3TgFAIgdGa/tfL1DAM9wj3Xq
         i2Qg==
X-Gm-Message-State: APuU4Z8v9DExOx9s6rI0mOKOD9M0SmNf8NKMC55F8lQgAZWpwXzxV3qj
	utQHFCD/jIvuZNTlgXqK/k+pJ27M0NLr9ykxkBkXD50fVJRWB3gtgJ+30KigS9l7Ew==
X-Gm-Gg: AYBFou0x0dPiMaOWLbylxkqT5LQeTLQzIyaLZLIWhZ3WbLGZj2OJlhvrr+m0701qA5s
	/GqPU3aJImHk05BRWTBwSdzKhR+QmlT1Vr/oYsrKXhA2O07HPcxuy5VGPgYdHUyCUKjxvn5AG2d
	5pdMwvI5GGT/2x+uExWrISPhX43VhrkgJrtdkvC2fGMpbvcB1XNNee5Jq8oYtGoRblDgMz6kd/W
	y0nAo7DNf/RlWYGJbe20S1424cQKHV693DbxdRl9ir/tmtstYWHo7fsuLu3/tCsiKdCooy2Qh/W
	YBJhHkY9FXGT9ABueSlB3pMFPIfq9rxa3E62aiYDdzi+J7oeWUnGyXiFZOKWPk6qIt7TvxqNnT/
	biNAI23iepdj8qGCA2rfT2vK0vZ+gZy2ZYdyKtFmq2edfuuyESjprrhJHxnZSf48PtvqkqQha3g
	0EtlYd3FBAtup10BuM9TymbnJzfh75mQABhwvI4/ZYzviFdCp5SdLmpLATP7DCIebHBOGq21vVs
	fzS7VCQo3RSSmjpvNDXwO5Mza1+qA+luwqB80TCQjzp5xvIBw4zKCiUhz+4S063dTCgRE7kwwRo
	On9pBKIWl3S6iEOeyXpIqkMsfxznA86veSNttpgWF7xyXrBFCUjH0YilmZY1WYpWcvJdgifOYim
	AXcD3zLWQAh5BsA4w
X-Received: by 2002:a05:600c:a115:b0:4b6:c939:3bfe with SMTP id 5b1f17b1804b1-4bb4ff4ad18mr794835e9.8.1794490362201;
        Thu, 12 Nov 2026 05:32:42 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585923bsm17339835f8f.11.2026.11.12.05.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:32:40 -0800 (PST)
Date: Thu, 12 Nov 2026 13:32:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com
Subject: Re: [PATCH v9 11/25] iommu/arm-smmu-v3-kvm: Add the kernel driver
Message-ID: <avW_9A48mtnK383x@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
 <avGk0ilyJh3obmKx@google.com>
 <avJidXM9yQOX4VBJ@nvidia.com>
 <avL016l_xASN5paR@google.com>
 <avNhekBYqiiZ9IM2@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avNhekBYqiiZ9IM2@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_053245_670476_CA624C41 
X-CRM114-Status: GOOD (  34.30  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:24:58AM -0800, Nicolin Chen wrote:
> On Tue, Nov 10, 2026 at 10:41:27AM +0000, Mostafa Saleh wrote:
> > On Mon, Nov 09, 2026 at 04:16:53PM -0800, Nicolin Chen wrote:
> > > On Mon, Nov 09, 2026 at 10:47:46AM +0000, Mostafa Saleh wrote:
> > > > On Thu, Nov 05, 2026 at 01:06:18PM -0800, Nicolin Chen wrote:
> > > > > On Thu, Oct 15, 2026 at 08:08:42PM +0000, Mostafa Saleh wrote:
> > > > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > > > > > +#ifdef CONFIG_ARM_SMMU_V3_PKVM
> > > > > > +/*
> > > > > > + * Two devices are involved: the aux device bound to this driver, and the
> > > > > > + * physical platform device bound to the pKVM init driver, which only uses it
> > > > > > + * for discovery. This driver keeps using the platform device, as it carries
> > > > > > + * the fwnode the IOMMU core and consumers link to, the DMA configuration and
> > > > > > + * the IRQs.
> > > > > 
> > > > > It would be nicer to have a diagram or so to show the co-relationship
> > > > > among different devices and drivers.
> > > > > 
> > > > > I assume the regular arm-smmu-v3 driver is a part of the picture too,
> > > > > when the pkvm driver binding fails?
> > > > > 
> > > > 
> > > > I can add some ASCII diagram.
> > > > If pKVM driver fails, no aux devices are created and the main driver
> > > > probes the platform SMMUv3 devices as usual.
> > > 
> > > I didn't check closely, but would it be safe to do so?
> > > 
> > > Is pkvm aware of the missing SMMU device and handling it properly?
> > > 
> > > When pkvm is enabled and the SMMU device is supposed to be a pkvm
> > > device, should it not fall back to the main driver?
> > 
> > If pKVM fails to init for any reason (unsupported layout or non-coherent
> > HW) the SMMU will be bound to the main driver so the system remains
> > functional.
> > 
> > However, pKVM will not be safe in that case regarding DMA isolation
> > as the status quo.
> > In Android, in that case, pKVM clears the FW (called pvmfw) that loads
> > the protected VM and authenticate it so any protected VM knows the
> > system is not trusted. This part is not upstream yet. [1]
> 
> You might want to double check a dual-SMMU case, where one gets
> accepted by pkvm driver and the other fails and so bound to the
> main driver.
> 
> It seems the pkvm driver would still pkvm_iommu_register_driver
> and carry on with an untrusted SMMU. Would it also clear the FW
> and mark the system as not trusted?
> 

That shouldn't be possible, if one SMMU fail the whole thing will
and the driver should clean up after as the probe is done through:
	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);

In that case, that system will be considered untrusted.

Thanks,
Mostafa

> Nicolin

