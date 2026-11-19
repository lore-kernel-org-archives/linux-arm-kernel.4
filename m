Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A62606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wMGysRQZ;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pbqoEbQL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fY+Pd4NWLtkS0HB6qP6ih+nJNWbdv9Us893L8bxy/2g=; b=wMGysRQZHZrRFOgdHVLa4TrxlO
	EtYjnyKXMZgl2LaG1jKBCxIm0U3omSdWBC2cd9wEj6Hmp0YmQnqOtpNUcaZEi/1zDOl+fcbQxizhJ
	dMPF/p2vrv+/MNA0/o+tjV/nfiEomEv3bC04SSar+og4+9jXXT2Yz+b/h8lwavaimQh/OtOYR6JYT
	P1lSuKj5hrf4KP5T2+NbALqu6ea/BDj3cDVzuwy3byvz0W99GeP8cI8nz1cgVVqAjathK0SDizq3R
	evhF2wFwcZVCNVQs5gXfssmwvz6Fecl+BA5SGHI//16QyYDi4CZgDmfvfUbXtVfHHEasq8aXeqT1P
	jMeZ+G/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU09l-0000000BgKw-2XMp;
	Thu, 19 Nov 2026 11:18:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU09b-0000000BgJ9-0j6z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:18:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb845433b8so33995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 03:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795087088; x=1795691888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fY+Pd4NWLtkS0HB6qP6ih+nJNWbdv9Us893L8bxy/2g=;
        b=pbqoEbQLWHQO5j/i4mLu5qCadH+OoJ9+nITKxsmaihU2kwFgBZ8KN7FkyxotAKYvTq
         mjf9dMMji//s1yfnsS0B7ZPWKVyTictcAaAg6bCHYbtyRWC6HJ7VRifJVxT/I65QMjjK
         RbTypMTWMxeKiVgvXK5MsNd2pMGtRc6Wy8FEgHRyli84riP6mmPBcFrMCZvtZXo+jZlx
         +AoUUHRjkf1rMBlJoZZ9kP9ITyTXObkVrZhYef1PhHvW7PjYnv+A+3YdPAuDcq/jn+vG
         2KgGzUgQUl9/+Gj+h0xxZShfrNYnSsR+VEdqT6mLJrtegCQ3+q+AbDVMcUMivCmRF6Yz
         DyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087088; x=1795691888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fY+Pd4NWLtkS0HB6qP6ih+nJNWbdv9Us893L8bxy/2g=;
        b=tt+GVbQrOFKBUwuLa/k6WT1Hk4Tdr7VYQCWOTiWLed9QxSCnHfH6JpKJWCuG+FUNjc
         hbVGPHFiy6xqYEz/eYHlVk6hMcoQ5lXcnnBGfZ0fcAB0wqbA0+bqNLcJkSUveOSHPbQo
         Brxmfpx69d4687xXXpr/IkbJZZy7guERgQ3pRDEwQRfNAhR7jiaglHmkXqDlN3XdJy06
         6l+5Lgc6mW0TCwXsMxS/z4WKQLMQhDM7USfN1qZl5QKvOHeMJqNtb5e1MjqHWPjD9Am+
         IAHn++kXT+hIKncpi8v8Y3TLyQXiyzGsuiWadKlOU9yaCW/xM3KzwmoIeWlti60e8Lw2
         Q9vg==
X-Gm-Message-State: APuU4Z85Rn+E+FomDRCDPFG29hBX1rkDADYWUZVfC/AFBltWwD87I3QM
	an1MFVd82lLqeZtAeQDO/5r0Q902MICdtQLxGnXYxei5GN/MP7JrtW28KQN4z6hlnZ1sw/eSdUj
	83Kvhjw==
X-Gm-Gg: AYBFou3DfZeoYskGjueglQ8V5ltyGiIsdCnLJwZfpazdkTxi4utJ7Xzn8tbcOumBAau
	nUXSlYBv+1/3vki3vo38W1GhOFHLomg2A7dZjm3HOGdcnJCSfIe9HY0UYrpZ48r5y0MZUWMTrRn
	zecB3pWnK9KjGqAwZYHgRYjNHGCLw3UdydRVQQJFcurDAhiyttAWGHDDpVcCSAFM6mcTlrQsvDF
	Tnv5YL46BuX0CiA30qcnvNICebzePGj3zGGdrRIfyEbPGwFb24y6TFz4pW+n3NL+cQv+OINg2D6
	3TlHK+zIwiwUNkBSs+pWb7IjC1KAsT7gy4qFZKBbxWcRl1uQobWYP/L/+6T3j+zMG8pXR2+XFYj
	tn0M4/Impe1Hqq6WB8DnJegDDxnDmwAj/hk9lHkON+yMu0bTa7l6TRjJiqzqQgKStokQVI1X0WQ
	jSB6hmSVs6ds46nWrDtI4YSl8K8CIFfyQzqCk+tkJfIJsFJxLq2HQbtT/6cTk76kRXgY1eaQIqH
	0x0kUDQzLhAlNK3LcaKWCmfThkUyzhFzHBiqdFJ0NJBQ2O1/q0vOlNQVCqI9u3apYIjHEGz6xzC
	jwrB7dKL1MeowxfNz5Lm/ZrjkSiZteHsA7IjegEfbX4CpjPZxYOiNrGaPeqkIiWwndBEMDE=
X-Received: by 2002:a05:600c:a10e:b0:4bb:5e6b:2dfc with SMTP id 5b1f17b1804b1-4bb851b6663mr297035e9.13.1795087087341;
        Thu, 19 Nov 2026 03:18:07 -0800 (PST)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655db6d45sm9766011f8f.33.2026.11.19.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:18:05 -0800 (PST)
Date: Thu, 19 Nov 2026 11:18:01 +0000
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
Message-ID: <av7a6RNSDSFH8t6m@google.com>
References: <20261015200903.2735565-1-smostafa@google.com>
 <20261015200903.2735565-12-smostafa@google.com>
 <auzvygiGRTWgJXzF@nvidia.com>
 <avGk0ilyJh3obmKx@google.com>
 <avJidXM9yQOX4VBJ@nvidia.com>
 <avL016l_xASN5paR@google.com>
 <avNhekBYqiiZ9IM2@nvidia.com>
 <avW_9A48mtnK383x@google.com>
 <avdI5olRpBdKeE9C@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avdI5olRpBdKeE9C@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_031811_240603_33262534 
X-CRM114-Status: GOOD (  23.66  )
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 09:29:10AM -0800, Nicolin Chen wrote:
> On Thu, Nov 12, 2026 at 01:32:36PM +0000, Mostafa Saleh wrote:
> > On Tue, Nov 10, 2026 at 10:24:58AM -0800, Nicolin Chen wrote:
> > > On Tue, Nov 10, 2026 at 10:41:27AM +0000, Mostafa Saleh wrote:
> > > > In Android, in that case, pKVM clears the FW (called pvmfw) that loads
> > > > the protected VM and authenticate it so any protected VM knows the
> > > > system is not trusted. This part is not upstream yet. [1]
> > > 
> > > You might want to double check a dual-SMMU case, where one gets
> > > accepted by pkvm driver and the other fails and so bound to the
> > > main driver.
> > > 
> > > It seems the pkvm driver would still pkvm_iommu_register_driver
> > > and carry on with an untrusted SMMU. Would it also clear the FW
> > > and mark the system as not trusted?
> > > 
> > 
> > That shouldn't be possible, if one SMMU fail the whole thing will
> > and the driver should clean up after as the probe is done through:
> > 	ret = platform_driver_probe(&smmuv3_nesting_driver, smmuv3_nesting_probe);
> 
> Hmm, if I read __platform_driver_probe correctly:
>  * __driver_attach() doesn't propagate ret from driver_probe_device()
>    via bus_for_each_dev to the caller
>  * bus_for_each_dev(..., is_bound_to_driver) at the end also returns
>    true, as one SMMU is bound to the driver while the other failed
> ?

I double checked, you are right. In android we have the following:
	ret = platform_driver_probe(&kvm_arm_smmu_driver, kvm_arm_smmu_probe);
	if (ret)
		goto err_free;
	if (kvm_arm_smmu_cur != kvm_arm_smmu_count) {
		/* A device exists but failed to probe */
		ret = -EUNATCH;
		goto err_free;
	}

We need that also here, I will add it in the next version.

Thanks,
Mostafa

> 
> Nicolin

