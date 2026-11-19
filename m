Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6854606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 21:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NRQqfYO1;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MxjRqEQd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jf8Lr4o3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=08XFKPlPZivWIz32hIgg4vqBbho/+cJ0DQm4DX6v8wM=; b=NRQqfYO1vhkQ/S
	3YOjMGuT6zO74SdKZnn83VGRlZtVmXfNPrPS2JvYzccglGVDbnWY1Xzqp+a1vKXCdQIe5rN2aVmJw
	x8OxNroQ7ffB2glsWqHCKpgtGcBtWBP48yr4AIrUlaXfKXYngK0auKr4x1jKZ+vvmzHzWIJUDR2yJ
	nvLYCSgDj+kyR7SBQDDYXqU0oWlg8sMeLxCZAzffPkB6h2DU6Z/V3FwEd02kZuBBRIo13n4MF5WYT
	FldgRyd5BuFBoEI7fwlKO9ZJXDiBHQ2WzxsUAU3Qi4GAZvHxTtm8iB6mVc8YmBgtjxZLnrj9puBjG
	GV8O3D8RluLnc1YQNAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9nG-0000000DUIy-3A6O;
	Thu, 19 Nov 2026 21:35:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU9nD-0000000DUIT-3lgW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 21:35:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJJ1P8d1671521
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 21:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08XFKPlPZivWIz32hIgg4vqBbho/+cJ0DQm4DX6v8wM=; b=MxjRqEQdo8igcqFA
	0nghddsNiy7FqZtU83beYzTvymRqG26jTbkoI43aT04Tulzfrlk8srkTk++g9COq
	pZOH0eEHDC6InqLdPjyoBb6dcEMWv9d4zpEdblMot5jUyBgCnMC28RWnC+SR8DvS
	mmbSkMrISE+x1OHcLZS6vSNMdXgHzQFtCla5NPx9quhtlEWjfnw/aQPeIeKKJe16
	qJwoHNjJ3WWLMyI1i0TmzfDz0rRb5HJSLPKvd9/ew9+sCDrYPxso6ELYm3g2X0+T
	GraI4LbIGkhUeKbc3KCDnBLvE1ilGNvlTyicacdyDjih/2X91bXZ6wAUMe+LtxyO
	ssJHQw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x70bjd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 21:35:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso286957eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 13:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795124141; x=1795728941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=08XFKPlPZivWIz32hIgg4vqBbho/+cJ0DQm4DX6v8wM=;
        b=jf8Lr4o3j6ibIeK+IYdn3QvpZ5o3wpOCDsAsTaqGmsjq/BCo1lwU6N8tQvsl7IDXzN
         zhY0rKWMH1DGZjU2+2rKE92N7iLLdKJDFmXoG5k6fViYLbvocQNJwq/Rv4D+6vCazRaE
         zQ/0jEFghTydJfPB3bYlos3mvh8zGBl+5EMvuY5hZmZRFa9ntff7qQEMUzGNcyi/25/z
         ecvCmxtjcu2tDSJS290uQcImk0zrBIi9a3yU4nyN2NSe+fkAJ87CZk6MPlv5IZeJG86L
         3DfE+qKZjQmN8JbIxmI3VTyXTPrTLdeICV9xX20jLnHPE1dvWHwGz2gJYoEU1sNKF4SD
         CWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124141; x=1795728941;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08XFKPlPZivWIz32hIgg4vqBbho/+cJ0DQm4DX6v8wM=;
        b=0b6BH1YqnTsqfd4qlRxoRSZ/ZTyTslRmorjWtVewhwq8/FqzOqpd5sYhc+2f0hw2aV
         xFBNkiAdLJKXmv3hYo82ZNqRZPqqYlJdEKcoUEJ5u+4sjKGaiUksMqBo8tbUAsQ5DS0O
         mdzqkk17I+IB4pgyQTu5KPbd/IX5mXcMiIjZddG3ZA6eLP+EesS12XXSnZ4Ue/d6lyC9
         cAbmoMvq6xted8QiMB1AQv/b3uOAMJUkgiHZASX1ziOgC7rcgK3zFkJFppjaye7WEJlf
         seVHwHyJu1oWz788AEUwujqApfOKhKUD1z+fLgRqFGZURtD8FFutyvWBy9NEPNQ1rSAs
         E+ag==
X-Gm-Message-State: APuU4Z+eP6Cogia6p5CNkHKyMBoT9DJWHi/631GFBpWNTpalbI9mms9h
	Nyhq38SCOUVQGZpIHIfPO/6YCz9Tykmxo69EzNpvCyy4gJjtcsMxaH8FX7eyGrjTdtBc69uocfS
	QasgQyi69Cf4Zg2YVn2HqstsexpGT+IXFzw7PtccGTH4O8n9HQLZ/3Nw/03NgII/RBKki8ZJl08
	cc/w==
X-Gm-Gg: AZFdTZc26OY9BEA6QJVx1MN5wouOSWjPcJzm96fhLzruWQndRYrmSJj0+QInBebZA3a
	pfNG92sG5cUAEgfaxh+RLunet/1LdVMx+80RsgKWzc3z/La8rjudLCoNH49xCrTwTqj50UoF1f3
	OOMMzVtPz9MbaVqVlTRdURKDG666bSwo88XC2ShkchLd5YCckiBXayordfqMCmh29MI4oME4b/L
	ths9vLpnKBz2Jh82jija9Pr1GI2uZBq5hKkBunrj294/b3NW22qwiU8QZpfUJIyt8xqxxTwOG6w
	2NxpH4e+NAXmrbEorImNcGny4Vbfhhvi/Zy//IS69YbxywAYhJ0HB9PEqQ56oCZ5XEvRQ1S1EFV
	VvS+ZMKj+IPp07Boiw1ySk2Yx9twTo/6whhWtgKC3BAiJEAcU/IzoH74r6SqJK4tIcEbbHeRZ8C
	W8rbP5GLFaRCdzc6kIDdIEFmNpKUKP
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr861584eec.21.1795124141223;
        Thu, 19 Nov 2026 13:35:41 -0800 (PST)
X-Received: by 2002:a05:7300:ac82:b0:385:4b9:18f2 with SMTP id 5a478bee46e88-3857093f077mr861540eec.21.1795124140485;
        Thu, 19 Nov 2026 13:35:40 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm1359625eec.6.2026.11.19.13.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 13:35:40 -0800 (PST)
Date: Thu, 19 Nov 2026 13:35:36 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Ahmed Azeem <ahmed.azeem@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mark
 Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Divin Raj <divin.raj@arm.com>,
        Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH RFC 1/4] uapi: firmware: arm: Add PFDI userspace ABI
Message-ID: <20261119133536.000013c4@oss.qualcomm.com>
In-Reply-To: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-1-4772d18b9115@arm.com>
References: <20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-0-4772d18b9115@arm.com>
	<20261119-topics-ahmaze01-upstream-pfdi-rfc-v1-1-4772d18b9115@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XXCjyokqHXWIwm3vOyekQg_1Pz_SWnZu
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff6bae cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=JfrnYn6hAAAA:8 a=wc18U7BjuWp5DWxAL3UA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA4NiBTYWx0ZWRfX0XuHj5gwzOt+
 /mn2GQ9P6nIs14d9QbqmU7x//7vQUsJ4WOnyMyyaSQ1+GkX8XLUDujRBc/2zgIH5oDube6uktXq
 Ed0waW67j0o41xp6dvzJCha6elrYgNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA4NiBTYWx0ZWRfXxLlI5hDiGpmC
 xcpGbz3zT8lWU7UrZP3swu8esQANENIG+QWh9s+m6zxCS6CZTY3U/AlLGtZqQmtULymTofoilB1
 pIJSBNoXJmN/Hwa/dqu97M7L5EPSjlLkQjXu/l3BMEK64OnTk+aPiacMduaOSct4i1lLUAY88aP
 aCdpsmkkgfhP7eavuAItbug/momu/ZrW7XgwgW55b0ttMZYpA2GvF9Blts4fc9UJH42DsBd9UC3
 FRXJRTM7Q/3HMK9ghG6a5ho3MOjMwRO73jNthFVc0/zbSWGD0mSG5VnmIGQabeCbO7SW/MLEuq6
 GDyjn5Xj3ykM92/514pLDID33gnknIYMjtR2ueiiM+SlB98N/ag9TMv11SRHmTMv0YWrGYJYlT+
 beLUXTNoKWgbzKM7cJOwe6mpvG80Y85vRiWwKJxaF7mMUZdiKUBUONC7zNrklIcW8Dkm5u4cTJC
 zxO9LhJ9rwKfbH7FsMg==
X-Proofpoint-GUID: XXCjyokqHXWIwm3vOyekQg_1Pz_SWnZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_133544_073082_0D09986B 
X-CRM114-Status: GOOD (  45.47  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 15:36:03 +0000
Ahmed Azeem <ahmed.azeem@arm.com> wrote:

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

This is very much an initial look as until now I wasn't even aware
a specification for this existed. This isn't the first such
similar system, and there are likely to be more, so definitely 
worth thinking about generalization at least at the level
of userspace interface. Bit tricky to generalize SMC calls if they
aren't wrapped in anything.

> Link: https://developer.arm.com/documentation/110468/1-0alp0
> 

No blank lines in tag blocks.

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

Time travel.

> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Reference:	Arm Platform Fault Detection Interface, document 110468,
> +		version 1.0 ALP0
> +Description:	Per-CPU Arm Platform Fault Detection Interface (PFDI) misc
> +		device nodes. Each node targets the CPU encoded in its

Trivial but wrap docs at 80 chars.

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

The naming 'test_part' is a little confusing given it could be interpreted
as thing to test, rather than part of a test.  I'd consider a rename.

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
> +
> +		* PFDI_IOCTL_PE_TEST_RESULT
> +		  Fetch the stored out-of-reset test result for the target CPU.
> +		  If firmware reports PFDI_RET_FAULT_FOUND, the ioctl returns
> +		  -EFAULT and copies a signed 64-bit failing test part
> +		  identifier to userspace. If the failing part cannot be
> +		  identified, the copied value is PFDI_RET_UNKNOWN. If no
> +		  power-on tests were executed on the target CPU, the ioctl
> +		  returns -EAGAIN.

I get that the intent is that TEST_RUN is the runtime path and this is
out of boot.  However naming would make people expect this to return
something after a runtime test as well.  Maybe rename?

> +
> +		* PFDI_IOCTL_FW_CHECK
> +		  Ask firmware to execute platform firmware resident software
> +		  integrity checks. The ioctl returns 0 when no fault is
> +		  detected. It returns -EFAULT when firmware reports a fault.
> +		  Platforms that do not implement firmware integrity checks
> +		  still report success.

Why not just make this a TEST_RUN of test 0 and skip having a separate interface?

> +
> +		* PFDI_IOCTL_FORCE_ERROR
> +		  Schedule injection of a specific PFDI return value for the
> +		  next invocation of a selected PFDI function on the same
> +		  CPU. The requested function ID must be a supported PFDI
> +		  function IDs. Only one pending injected error is permitted
> +		  per CPU and function, and a new request replaces any older
> +		  undelivered request for the same pair. When the injection
> +		  is delivered, firmware returns the injected value in x0 and
> +		  zeros x1 to x4.
> +
> +		These device nodes reflect the PFDI 1.0 ALP0 specification.
> +		PFDI state is not persistent across reset or firmware update;
> +		userspace must rediscover capabilities and any test state
> +		after such events.
> +
> +		These nodes are intended for platform bring-up and validation.
> +		Access should therefore be restricted to privileged software.
> +
> +Users:		Platform validation and manufacturing test tools



