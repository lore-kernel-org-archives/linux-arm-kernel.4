Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39601606A681
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 04:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lNbo8e6q;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=daK0dHOR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G4Gd4Tvu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OIMcSFsrYZPx5tM1ZfU2cFMDo/op/ylNmm2WEOSFOdY=; b=lNbo8e6qfxHDMGLHUGWtpVDumy
	GlycRdNJ6omgt7ArYVV2LwuySGP8VTCF8+ejwDabb4rWfOJWpO8S8hL9ZDyk+CWRMbc4Mgl1Hg1zs
	inF9KBjWs9mD8Qt2EL0NMLoxc/4H3d/+qdzXf+KJfISrMK+OLTYSs7/8730OLgdz3JnO7uW362fzI
	jLX/JDMmOt18cj6XOM1ngkesBXl8lz+S1M/xBQuinp63SQc+oObH9z+I4NbTpHgcVcXOhqKqYPddp
	+u97s8w0gpeOXLCS2zUchImVgosPJ3LipLXMb/KB9ySFt98Xj5JxgZ4TEP+lHa0c476aln/z2ERCS
	CMWqx3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUcVC-0000000GkN9-1Ec0;
	Sat, 21 Nov 2026 04:15:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUcV8-0000000GkMU-208S
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 04:15:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL4BGOd3406678
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 04:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OIMcSFsrYZPx5tM1ZfU2cFMD
	o/op/ylNmm2WEOSFOdY=; b=daK0dHOR/AMPZH8w3KYSsDYAnHcLNrCRWu8rTXse
	dqMsh1bXfzQNTHZ5rADsOuQoAVYZJ+azjPH6Mn+lP9EQDDMrZfYKpp/y13o+b2/a
	tDa+yiE8ZVTP/RsqY98EmFX/SqQeNJuFq1J8gACd55YFitmw/ten/rPyQUg9w0D4
	iafHes1duRP4ZIyVoIlaXX0zXhq1i3LZhNiJRh3bNzPIxgqf4sAcLuyTXxqPaGPx
	EXAtaZGTh/kVGRUdlcKnPdwQ9ywQhi8tI5V9c997L5/vBL4vJJtZ3q3w9LQfMFST
	hHP/w0WjMFdsm8KN+YTqmwKirKuTfAlTeGJKanYAHL4Liw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mg86jg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 04:14:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38531c1a566so3828789eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 20:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795234496; x=1795839296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OIMcSFsrYZPx5tM1ZfU2cFMDo/op/ylNmm2WEOSFOdY=;
        b=G4Gd4TvucoxaWv3EdIVWukUVmrrybwXptpCPl+hqDjeb60G+w2BCS4zO+Pj/dbeGnj
         QZsdbSCYhFvYEFrYusj33hWNesuo4OCPcodUbDXSPpf1fFjOPVv3l+aqCUNGN7WfmLbQ
         CNkYwlmAXTuM30ijlGK4Itl/BdJfOE3sMQfxnvXb7uMO1wvph7iXTR/fNnUB0OeTBdX7
         7quhKW4HL8GTtCECrrBltM1cuM3hxQCOGFBfj/MGVsAgxWX6U3k7Qo+kDvOkrstvULX0
         tYoUm5YN9BRCH2OetyBwhS7O5K8Ydw+1R9QEfZWEfuKcT14TLONPXPcN2XSi5LqBIOol
         AniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795234496; x=1795839296;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OIMcSFsrYZPx5tM1ZfU2cFMDo/op/ylNmm2WEOSFOdY=;
        b=2V2I5IAbITmeyUOYmx4DSXVl/GM8inYCRJ1npQEIgsY0xaOOwS2eS4zsFSWt9OKITr
         iOJlQ1mle12vjZDmUjrntZHBO52zSEGl+gF/mAmCmFU3xQoZhSwPz/KLrAFZf31r/HjG
         zKLLMW0WZqrfgx9ANXmRvtTTv2m3xzUGlMN80YXI2EtsaBa6SSZMvz1NeXMsb+Nh79Iu
         SbXSIDIZyOndjFKqocn1a1Y2Lp73eQtdi93ViQKlNZ4DKVKxxYVFDeiX0Wevj1uD2cWv
         AvndJJvkqgVtQEHBL1x+L/m1EKp8Dj0OiN901c175p9x57pZXIayYIORPbHPi3tmqo+D
         nfpA==
X-Gm-Message-State: APuU4Z9wTY2dU/pwTL3hJ2IENQR5F049wC04eD/keXTWUJDBt0TuZuqe
	SEHKhHEpiD/0n1CqLDVGP1l/T7RsB20shEqiT8a3rS4ylmaZLQCB9gItpAuEH8nT6ZWq91Z8nj5
	eXgfyTaJTlBICJe6tdyVzHv9iRfudsskEPVCeKXg1vnIYfwT1e/9XXNRvAS9eHDevOBE8GHLWrQ
	T4YA==
X-Gm-Gg: AZFdTZcGJ5dNTzR+qpzn0V46AElBgmDtyAb4mPQsawZ1Fl9fKruFvR80DKwPR58sxCN
	Zycz+5HNkG5yvteoUKpE7at3qZoCgivaITj0ZcU8SeMdGzp962aWiAVXu+c9kmDJxiGULZIBvB4
	sZjhCWobORxEhw6ZCtjakFH0m+2N2VFqFoSMNQeCVejUjfQbviCVicqkkAvk2MWAdZUTijpCwBm
	vT14brgTrPPsaDgbQtte3DAzwopwFXxTQx4A51CoykuGcldLJiX0E+8XarYJOEkT05+Mc8ZprjH
	McEVajbChkf6vsi60PW8agysy0DVchQygUBjZOJXxwKbMPMoYWeSqo0xaHr5dSvTNbvR5c6MK5T
	aCu5D0+23C9ulzmbvqihf9aRhHdd153uJvYVs8z5exnvIDMR296wTMSX9KeNVW0rxmVWUB64H9j
	XygortkZrJVrnexoKLhOV7kw==
X-Received: by 2002:a05:701b:4502:10b0:1b2:539b:496c with SMTP id a92af1059eb24-1b5569050c8mr5657066c88.35.1795234495897;
        Fri, 20 Nov 2026 20:14:55 -0800 (PST)
X-Received: by 2002:a05:701b:4502:10b0:1b2:539b:496c with SMTP id a92af1059eb24-1b5569050c8mr5657031c88.35.1795234495249;
        Fri, 20 Nov 2026 20:14:55 -0800 (PST)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm10388581c88.3.2026.11.20.20.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 20:14:54 -0800 (PST)
Date: Fri, 20 Nov 2026 20:14:52 -0800
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Ahmed Azeem <ahmed.azeem@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Divin Raj <divin.raj@arm.com>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        jithu.joseph@oss.qualcomm.com, Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        Ashok Raj <ashok.raj@oss.qualcomm.com>,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH RFC 1/4] uapi: firmware: arm: Add PFDI userspace ABI
Message-ID: <awEavIhFldTD2k46@hu-ashoraj-lv.qualcomm.com>
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
 <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-1-4772d18b9115@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-1-4772d18b9115@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAxNiBTYWx0ZWRfXyHB1ShXET2MS
 8kt4E5gpCFVp+onvwoFHnIPbu9Bt7fCw+sLrGmd6E1KtTeuiThSzLo2LnnW8qZbcwkhGt/HKh2Q
 Lp35siCISXwbMPllFhCU5S+uUE4I5c6xX6NpEzakOTxwX0vDv+R/8izGOMYIS4CeJKXd8fNLttU
 At7iKqtdBUdyzQExkEYgHt/jtLL+VWtehncH505Lh2o0h/GSmhBUSYNby9lUJQBqA33jmlQ84BL
 8QOqQtRMsS3EJL+ei5lYunvjDfGGQKiKYEYNKLwR5i3zeKXJ0rmdPzk0RdAd8irqVPEnJIvhS0A
 4pSgn8nbtKoFO/+wNtcwcWHPl79q+K9+881Jw2/qvY8A5ajELEdass5r/fuqHspbBkXbAu+5xLH
 NHZUkJ/5gFUwaNs3h+1zt2z8mpaTNVFLGRxfvUmAmBHCL4ZUZD9TVvsNYa7UpN0OMF3v45yMADR
 yS7vI4wOeaApIGRzGWw==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b011ac1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=JfrnYn6hAAAA:8 a=ibG3jk6wdz103AFF48AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAxNiBTYWx0ZWRfX49iM1f599ZfY
 Bqua6/0E10sU7RYnrSq+GaM1e73/5G/kGQmVlhkiqOY01Hpg+0yB6nRkB8LtR8vBXXUyQ9x8C2J
 LKO8LKy5kGjpqZe2KFOBi1Yk/P5qYdk=
X-Proofpoint-GUID: R35zks-R6nTm7iWugyUGSmnABZuv_HFU
X-Proofpoint-ORIG-GUID: R35zks-R6nTm7iWugyUGSmnABZuv_HFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611210016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_201458_661223_9BE64B0D 
X-CRM114-Status: GOOD (  40.25  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 03:36:03PM +0000, Ahmed Azeem wrote:
> From: Divin Raj <divin.raj@arm.com>
> 
> Define the userspace ABI for the Arm Platform Fault Detection
> Interface (PFDI).
> 
> Subsequent commits introduce a driver that exposes a per-CPU misc
> device. The ioctl definitions, data structures, and return codes
> must therefore be shared with userspace. Add these definitions to
> a UAPI header and document the ABI for /dev/cpu/<cpu>/pfdi.
> 
> Placing the interface under include/uapi ensures availability via
> headers_install and clearly identifies it as a userspace contract.
> 
> Link: https://developer.arm.com/documentation/110468/1-0alp0
> 
> Signed-off-by: Divin Raj <divin.raj@arm.com>
> Signed-off-by: Ahmed Azeem <ahmed.azeem@arm.com>
> ---
>  Documentation/ABI/testing/dev-cpu-pfdi             | 103 +++++++++++++++++++++
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  MAINTAINERS                                        |   7 ++
>  include/uapi/linux/pfdi.h                          |  89 ++++++++++++++++++
>  4 files changed, 200 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/dev-cpu-pfdi b/Documentation/ABI/testing/dev-cpu-pfdi
> new file mode 100644
> index 000000000000..e07ed6baa7f8
> --- /dev/null
> +++ b/Documentation/ABI/testing/dev-cpu-pfdi
> @@ -0,0 +1,103 @@
> +What:		/dev/cpu/<cpu>/pfdi
> +Date:		May 2026
> +KernelVersion:	6.18
> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Reference:	Arm Platform Fault Detection Interface, document 110468,
> +		version 1.0 ALP0
> +Description:	Per-CPU Arm Platform Fault Detection Interface (PFDI) misc
> +		device nodes. Each node targets the CPU encoded in its
> +		path and exposes the PFDI service implemented by firmware.
> +		PFDI uses the Arm SMCCC SMC64 calling convention and is
> +		PE-local. Userspace is therefore expected to bind itself to
> +		the target CPU before opening or issuing ioctls on the
> +		matching device node. Each node is single-open: only one
> +		userspace owner at a time may hold /dev/cpu/<cpu>/pfdi for a
> +		given CPU. Additional open attempts fail with -EBUSY while the
> +		device is already open.
> +
> +		The ABI is defined in <linux/pfdi.h>. The following ioctls
> +		are supported:
> +
> +		* PFDI_IOCTL_VERSION
> +		  Read the PFDI version for the target CPU. On success the
> +		  ioctl returns 0 and copies a 32-bit version value to
> +		  userspace with the following layout:
> +		  Bits[30:16] PFDI major version
> +		  Bits[15:0] PFDI minor version
> +
> +		* PFDI_IOCTL_FEATURES
> +		  Query whether a PFDI function ID is supported on the
> +		  target CPU. Userspace passes a 32-bit PFDI function ID.
> +		  The ioctl returns 0 when the function is supported,
> +		  and -EOPNOTSUPP when it is not supported on the target
> +		  CPU, reserved by the specification, or otherwise not
> +		  recognized by firmware.
> +
> +		* PFDI_IOCTL_PE_TEST_ID
> +		  Read the test engine identifier for the target CPU.
> +		  On success the ioctl returns 0 and copies a 64-bit value to
> +		  userspace with the following layout:
> +		  Bits[63:32] reserved and zero
> +		  Bits[31:24] vendor ID
> +		  Bits[23:20] reserved and zero
> +		  Bits[19:16] vendor-defined implementation ID
> +		  Bits[15:8] major version
> +		  Bits[7:0] minor version
> +
> +		* PFDI_IOCTL_PE_TEST_PART_COUNT
> +		  Read the number of available test parts for the target
> +		  CPU. On success the ioctl returns 0 and copies a signed
> +		  64-bit count to userspace. The smallest schedulable unit is
> +		  a test part, and valid test part indices are in the range 0
> +		  to count - 1.
> +
> +		* PFDI_IOCTL_PE_TEST_RUN
> +		  Run a requested inclusive test part range on the target
> +		  CPU. struct pfdi_test_run.range.start and .end are signed
> +		  64-bit values.
> +		  Passing start = -1 and end = -1 requests execution of all
> +		  available test parts on the target CPU. Any mixed use of
> +		  -1, reversed ranges, out-of-range indices, or non-zero
> +		  reserved arguments is rejected with -EINVAL, either by the
> +		  kernel before the request is issued or by firmware.
> +		  If firmware reports PFDI_RET_FAULT_FOUND, the ioctl returns
> +		  -EFAULT and copies a signed 64-bit failing test part
> +		  identifier to struct pfdi_test_run.ft_id. If the failing
> +		  part cannot be identified, ft_id is set to
> +		  PFDI_RET_UNKNOWN.

Hi Ahmed, Divin,

+ Tony, Boris, Jithu

A few UAPI/design comments below.

The range-based PFDI_PE_TEST_RUN operation has a reasonable case for a
structured interface: it takes an inclusive start/end range and can return a
failing test-part ID.  Encoding that in a sysfs write would establish a
permanent text grammar and still require a separate result-retrieval
mechanism.

However, it would be useful to explain why all of the interface is exposed
through per-CPU ioctls.  Intel IFS, for example, uses sysfs for simple
control and persistent status: run_test, status, details, image_version, and
current_batch.  That does not necessarily mean PFDI should copy IFS, but a
hybrid design may be worth considering:

  - sysfs for stable scalar discovery/status such as PFDI version, test
    engine ID, test-part count, and power-on test status; and

  - a typed interface for the range-based test execution request and its
    structured result.

Also, before struct pfdi_test_run becomes stable UAPI, please consider
adding explicit flags and reserved fields.  The structure currently leaves
no ABI growth space, despite already having a special -1/-1 all-tests
encoding and likely needing a structured test-result field.

Finally, PFDI_PE_TEST_RESULT reports the result of tests executed at
power-on, before system software booted; it is not the result of the most
recent PFDI_PE_TEST_RUN.  Could the naming or ABI documentation make the
power-on semantics more prominent?  The current name is easy to read as
the result of the runtime run ioctl.


> +
> +		* PFDI_IOCTL_PE_TEST_RESULT
> +		  Fetch the stored out-of-reset test result for the target CPU.
> +		  If firmware reports PFDI_RET_FAULT_FOUND, the ioctl returns
> +		  -EFAULT and copies a signed 64-bit failing test part
> +		  identifier to userspace. If the failing part cannot be
> +		  identified, the copied value is PFDI_RET_UNKNOWN. If no
> +		  power-on tests were executed on the target CPU, the ioctl
> +		  returns -EAGAIN.
> +

Hope this helps.


Cheers,
Ashok

