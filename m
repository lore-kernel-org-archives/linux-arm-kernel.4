Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21A5606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 21:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nKN16gZm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aT9e0vZ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YwlY5+8HMIfOP8gjeCqlZaPCdsmRsLFY3NloYb5Xk4I=; b=nKN16gZmGxo3D3vBAHr7uQ5NGq
	BCureCAsFZ1X2Myi1VEEk2KOHyAuMoPmT9pFJdABdmt3WpcbFukgzIA6PfEWZrTavSVFH6ybs/GM/
	3fl3cEXGQ/iZbion+2nQMjWz7g+nn826UVao2k8ZAmVNz0PlO5u63loZo1V2YcPfxkhx+xsJ2n4RJ
	KknxFwPQh9v6R5OlFvnO+SmHZXx8voIeAdIO9xRPmLPdNwGDMUje2u7mqaBuepY9U3PSgkof8kFgv
	EMCK8oHgfZRJ9ZCFVLT3OutnWLasx+Ht7wVHbcQxkkNrzslE497abbu5Y8VphodytrvL1Hl/BzxS6
	uxePECzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVElH-00000001lj1-1fYJ;
	Sun, 22 Nov 2026 21:06:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVElG-00000001lh1-2XcI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 21:06:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A062960E85;
	Sun, 22 Nov 2026 21:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC971F000C0;
	Sun, 22 Nov 2026 21:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795381568;
	bh=YwlY5+8HMIfOP8gjeCqlZaPCdsmRsLFY3NloYb5Xk4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aT9e0vZ2pqv52Qiex10tpuz1zIAEEspXo2mek0V8O7o6ySvVMgWs7yrhTsMGMfV2P
	 eIB0L/qXawckjHrNi/esY9WB8cUEBkGgycLSyTmZLIK4wM8JGOlLLiDgRfdg92Vfu+
	 9XLCh/7DIGGSLKRav+uoCa+xCmmNhn7PhxV+VdyhA2x8AeeTjhqa8BO+nsj3DgCwqD
	 pobNJUKYeU3ICt+SSdQOc19IZ2bHM3J9OYak6gKUp+JHT8TySD5nYy5FBrapUpDuVP
	 GHOQYkCen/FynmaLT87JD5rUYQXe4OeNjpHH02PrvKgQOjFIkbDVqYn+6GzJazJLQ3
	 gqJhHBfKWLPPw==
Date: Sun, 22 Nov 2026 21:06:04 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Ahmed Azeem <ahmed.azeem@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Divin Raj <divin.raj@arm.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC 3/4] firmware: arm: Add PFDI run, result, and error
 injection support
Message-ID: <20261122-cute-wildebeest-of-downpour-b21fdb@sudeepholla>
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
 <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-3-4772d18b9115@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-3-4772d18b9115@arm.com>
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

On Thu, Nov 19, 2026 at 03:36:05PM +0000, Ahmed Azeem wrote:
> From: Divin Raj <divin.raj@arm.com>
> 
> Extend the PFDI driver with ioctls to execute tests and manage results.
> 
> Add support for PFDI_IOCTL_PE_TEST_RUN, PFDI_IOCTL_PE_TEST_RESULT, and
> PFDI_IOCTL_FORCE_ERROR, along with per-CPU state to serialize test
> execution. When firmware reports PFDI_RET_FAULT_FOUND, return the
> failing test identifier to userspace.
> 
> Signed-off-by: Divin Raj <divin.raj@arm.com>
> Signed-off-by: Ahmed Azeem <ahmed.azeem@arm.com>
> ---
>  drivers/firmware/arm_pfdi.c | 225 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 225 insertions(+)
> 
> diff --git a/drivers/firmware/arm_pfdi.c b/drivers/firmware/arm_pfdi.c
> index 8c6d315b0572..22a69b12dbc8 100644
> --- a/drivers/firmware/arm_pfdi.c
> +++ b/drivers/firmware/arm_pfdi.c
> @@ -350,9 +543,35 @@ static long arm_pfdi_ioctl(struct file *file, unsigned int cmd,
>  					 sizeof(count)))
>  			err = -EFAULT;
>  		break;
> +	case PFDI_IOCTL_PE_TEST_RUN:
> +		if (copy_from_user(&test_run, (void __user *)arg,
> +				   sizeof(test_run)))
> +			return -EFAULT;
> +
> +		err = pfdi_pe_run_tests(cpu, &test_run);
> +		if (err == -EFAULT &&
> +		    copy_to_user((void __user *)arg, &test_run,
> +				 sizeof(test_run)))
> +			err = -EFAULT;
> +		break;
> +	case PFDI_IOCTL_PE_TEST_RESULT:
> +		err = pfdi_pe_get_result(cpu, &ft_id);
> +		if (err == -EFAULT && copy_to_user((void __user *)arg, &ft_id,
> +						   sizeof(ft_id)))
> +			err = -EFAULT;
> +		break;
>  	case PFDI_IOCTL_FW_CHECK:
>  		err = pfdi_pe_fw_check(cpu);
>  		break;
> +	case PFDI_IOCTL_FORCE_ERROR:
> +		if (copy_from_user(&error_info, (void __user *)arg,
> +				   sizeof(error_info)))
> +			return -EFAULT;
> +		if (error_info.reserved)
> +			return -EINVAL;

Do we really need a strict 1:1 mapping between the userspace IOCTLs and the
underlying firmware interface? Looking at the proposed commands, we might be
able to simplify things significantly:

1. RUN and TEST_RESULT could likely be combined into a single interface from a
   userspace perspective.
2. I'm still unclear on the intended use case for FORCE_ERROR (echoing the
   earlier question on the cover letter).
3 FW_CHECK feels like it belongs in driver initialization to catch boot-time
  errors. Since it's hard to see how firmware could safely execute runtime tests
  without OSPM awareness - despite what the spec suggests - exposing FW_CHECK to
  userspace doesn't seem necessary.

Given that RUN appears to be the primary userspace entry point, would a simple
sysfs attribute be a better fit here than adding a new set of IOCTLs?

-- 
Regards,
Sudeep

