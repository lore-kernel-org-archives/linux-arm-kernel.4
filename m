Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83E3606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 19:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sgTu3vB5;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PV+X2Fvs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3owYrI/0Z3GKKaUgbIZQvjxUR9mSehq81egiU0Y2vio=; b=sgTu3vB5TzRPY+YKbOsc5e3/78
	1v1CkIjchMItkqe9HvXB9oQ4z1XmKwiGKrC/cniybduem0EgKItx53UI1gtTkpT1dy/z5V0KHiQyA
	WCZyqGbgSzXuTh7JDAx+1rP8PQxCcR4CulxaJ5sCbxFb2I4uCy9/BeJeYIXmIuKIj83Qd7wWbzQ5M
	OZU2xKh/hoLGCwtyLIxGYO98yWUWWIgF1hvJmvca803fqpZD2/LPRxlEWdmqajbVYC1G5DlMrTNMf
	YRAYtaDDMyUxoVgoU/RDvifTZilM/DSAi3PtJjXD+rhcgYPc9JwCLgPEGc/TBNZ8XlvbJ7XU9M+Zt
	D+KbIddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP49-0000000DSsd-0JfZ;
	Fri, 06 Nov 2026 18:53:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP45-0000000DSqy-2E7L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:53:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so10299075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 10:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793991208; x=1794596008; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3owYrI/0Z3GKKaUgbIZQvjxUR9mSehq81egiU0Y2vio=;
        b=PV+X2Fvss/yayb3fhYGrStzMOEOMMBXi8vbLx6DGi8PgWkbVshcim80QhjVKVy/+5J
         TNkGW00HBe7GvRzSQ+Y+Av1xr/fb1viID9b2hnejgdr0CYU6ssazviSSeF3MAxMPl4M3
         OvbfS93IKDXxcxQ0X54aNdvsf9qk6a1VIuzyFnp4486q+b7RvhOagRjAS5m5e6RYJY6i
         0H/V9iQwkIAzj8nq49CPRQYBI3KdEmT7ep26a6FmLIPXl9iFuP7IXFVKZ+9/8qFwIHc7
         wUOujewyckL+45clGBvhw0b9iok7sCYnpzaDqb52yhfk7Wnob/47ZUDWssGz1+/hwc+l
         58FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991208; x=1794596008;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3owYrI/0Z3GKKaUgbIZQvjxUR9mSehq81egiU0Y2vio=;
        b=q9U4K81THzEheMrebPAxwzbLuOGpN279qeYJrNATh1Qh8es+V5C2baAwHFYLGk3k4G
         89BhBqEZP3bKgpZJaLtw6iSUtJ2NwuwLj3X14gSQJMio8vVMBoxaUzyfwcqT5L7f4hIk
         IpYKMj/+ZasOsXAzjtmVHn2oFD2BdrqqgkeO2nLs3AYqQsjdTLIbACdLRTLN71S/3tRA
         +g882dwZOkR7ZSE2Xijvsp/dVYmuknzD+r4oSQ5FQImHkrmAYS3SP2aI8pBs2E9I0JXT
         sy4gjDxBfdshS7LLn+r+SaE/OgJkcgUyVuDuy/3YaZuqF6MSlXQdDUNpxInK024Rf0b0
         RSFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBuZkAQmKrSV3M1agP04tbutLZZxhLyolEP9i/CebZgNc6OkaqxZjVALhTAWqxj16zVNVQqFnBlFGgTceCnk45@lists.infradead.org
X-Gm-Message-State: APuU4Z/U3i02dnI4k8qyf2JNl0bybcZEBIspu3ZuPXguSbI+e+gg4qCd
	qEZpT3APIaTVvek/hixVu4+J/youV3mawWkykA5OavTUgMzypQT97NVMHn/SS+4qIA==
X-Gm-Gg: AYBFou3WGj5z7ZdNxZSGtE95OzdfHZVFbpYS1RfIyjYEVdFYdb651xfWSlSMatU2k7r
	QAbRtJKVVf5R2q6iMUdgRMa96rPoL8GrTGvhF4YF7v0eKTPVoT1J64WmWGpExgb4BBqHtufV7I/
	85yzrjygYqW0aud5XjJS1oaCOGpp6R0nxOXbxXtp44ztp6Q5r2VirxiXQnrg0gOBGP4nz756NBx
	nL9JF8AJVizLug+LxCKXuDcpd3H8uG3/opVqFua46HfIHqGvrG/WM/2zFAIGa3GJE51ZfxSncgC
	8jaJfPR2roKLuYLfeCfBKkwkp+SPIcmjlfvsIFzjJaaC5O4gQeUUPGLsH6XsLt7i43MYMX/dTEZ
	BsFDDJgk4r0YEAv/oI+D766qWeGw4nqjr7Shcpm3iP4hi+ohOfJ9eIP2FLwjPgAE3LXuZ2ZTZCw
	aneJPrP+Z50NX/LpDQlQWyWF3BdwWks1AOvq+pmr28F5g5J/DGP/kp3BIVgX8SXVsfGSfnKZJCH
	67zOb56it0PXeRiW5MrigUBelB8wnyzHqHBw5nGWwEUIOHukTG2f+M7b0vIKcUjm9t9+Jeju4Y+
	E8M/jP5sLN0nEnGPJl7evMIUbz/xxUujSr2oFhhyC3RGPq4kNPb10X97dF23yHs6ec9vMrnnpdU
	SyD7G9CmNTg==
X-Received: by 2002:a05:600c:1914:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4b6de788f5bmr58350415e9.11.1793991207222;
        Fri, 06 Nov 2026 10:53:27 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62ecc1sm626645e9.2.2026.11.06.10.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:53:26 -0800 (PST)
Date: Fri, 6 Nov 2026 18:53:21 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Xuheng Li <xuheng@cs.columbia.edu>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Quentin Perret <qperret@google.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] KVM: arm64: Don't replace a valid hyp block
 mapping with a table
Message-ID: <au4iIai1DiXaPQiD@google.com>
References: <20261105-hyp-pool-and-map-v2-0-44a6ca90190b@cs.columbia.edu>
 <20261105-hyp-pool-and-map-v2-3-44a6ca90190b@cs.columbia.edu>
 <CA+EHjTx-X_2DaO6Yt-AHsP55SFWjz_EYxEr-TB9WSN-ZT+d3FQ@mail.gmail.com>
 <CAPOPQMB6eU0MYNewcq8HKsEMchwY-X3aT0Km9uULBappFWZcjQ@mail.gmail.com>
 <CA+EHjTz-R016BwhcptZ3xVQe+a8C7au6ZL8jwZANdTf=cXRZHQ@mail.gmail.com>
 <CAPOPQMCQfYWRDRvo4PPFW0RAyqNmns6TqS+QYE3-5SM_NFRMQQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPOPQMCQfYWRDRvo4PPFW0RAyqNmns6TqS+QYE3-5SM_NFRMQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_105329_585052_8DF119CA 
X-CRM114-Status: GOOD (  17.92  )
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

On Fri, Nov 06, 2026 at 05:17:54PM +0000, Xuheng Li wrote:
> Hi Fuad, Vincent,
> 
> On Fri, Nov 06, 2026 at 02:34:55PM +0000, Fuad Tabba wrote:
> > Actually, like Vincent pointed out, why the WARN_ON(). The caller can
> > just handle the error.
> 
> Makes sense, I'll drop the WARN_ON() and just return -EEXIST.
> 
> One thing I noticed: the kernel-doc of kvm_pgtable_hyp_map() says that
> a mapping over an existing one is "rejected with an error and a
> WARN()", and the leaf case in hyp_map_walker_try_leaf() still warns.
> Without the WARN_ON(), the comment would no longer match this case.
> By the same reasoning, should the leaf case's WARN_ON() go too, in a
> separate patch, with the comment reduced to "rejected with an error"?
> 
> Thanks,
> Xuheng

You're going to make me regret my suggestion about removing the WARN_ON() :-) 

Indeed we should probably align the behaviour.

We can indeed drop the WARN_ON() from hyp_map_walker_try_leaf(). The if
(kvm_pte_valid()) you've added should catch this case anyway. 

We can keep the WARN_ON(ctx->level == KVM_PGTABLE_LAST_LEVEL). If hit, that is
an internal error...

I don't know if that warrant a different patch to be honnest... none of that is
fixing any existing bug. But no strong opinion.

-- 
Vincent

