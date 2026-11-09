Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71A0606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 22:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g4/aCO6f;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k27vhz8w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=emQFbWgA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=; b=g4/aCO6fd4XKhu
	F52KibP6mfPjDPwua8d5jN8wKzjEVL/iKlYj3USDxZCu8FX7ugtFLgz+CiWBdn21hLZX56LmMryu6
	2xJ4ZtVOMvuTqX7qQaGWDsRBg1m0MDj3u7PI1nJxWQu0rGl2KmZQJ7hYcg+OIA4RTFSYQ2w2IuUf7
	+7y+SUIz0eekz9O/xezbYo4j4le38FWZzm5A0PSxu0m/1/haoLGqsNM1IaNTEBLbjIrrSQB6vbkAE
	xKG9owlmcuOJPS6AFPjAXdqH6IcEj9Q2kpCp8Yp/ekgbS8j5ZDqS/7YYU2PdjMNw+a2/vNjb5htty
	Cnn0Shd5amIqjJl1TzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXWm-00000001qnw-2GNV;
	Mon, 09 Nov 2026 22:07:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXWj-00000001qnZ-2iSm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 22:07:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LAJc21062289
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Nov 2026 22:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=; b=k27vhz8wVvvcrL6l
	474K+JnAqSvQJwpwRco1Wu24Vl/Nep5ME71Q9GOO0jRZzox6C6TRlfar/s9scZQ7
	zuITRoLj06qza6O/7o/KjvESXHDjvM/TsyhMmq/+Fe4bgKFtB3d3v45ZD9dvkiAI
	8JNiper23JeS7ZR6dptscHWBxIyDAh9siyzyINiOLiDsCxLc4ggeH+TiTRAggUxW
	jACzqyP4Sro70axn9Gvqk3+WlZL0s3FWA3kcTDzYfhK+c7WsJRUx3tusHxRg1ava
	7lAa74keKoyQ5Rj1tjDDFg/X3chbhJB8ydGW329Jeah4miF9OF6lvJ6O27HNtnpc
	04txSA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydjcas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 22:07:44 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-37390b2989bso2438292eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 14:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794262063; x=1794866863; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
        b=emQFbWgAuSxFaF69bdvPitBfqRUGKxmCZXX8ZV8xVN9nxhQ3t0J4+z+5Qswmh91W6a
         Iq8g4nMLBhKKVl8PNV/+93WNUA9wqTK9yT7t0clGPOpXHaq7Y2rQJnNAf+7ESH77PlMh
         4si+B1brzJXHvGB8rJwkNmw1qX5cn2XuMJj8Oi0HgZdKpgGyYtH1Fv7alvqardbeifqp
         a61OgKn0Pwh7/lbn2koszvVwiNtG4q9aAM+loNuofQb1rutr9kay76NOgilCGRssUUva
         q6lNZjAvJixOZnZZ0Cvd7SGCa8VV+S1ExCfIyHZWv51yqcaJ9KHgRL8oG5slIbfETYXI
         kFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794262063; x=1794866863;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRDiN5YvmzpYpVtQ4WCNWSVVBmZmOtN02V0vIY9KlBc=;
        b=E7gc89GU6NxTxKaGFay3f9dL0S/EXjc/p9w+8BeqW+xUIblAKkgCdr8EPPbzKVDaPq
         EWYfeZzbdt7JQggc2+x8PTdfd1cD25RMWyvJDKNDZG3EyRGgzyQU6RgHm9yHrfowBusY
         /uMMKA27cQ11MEen2gaobYsacsJ8F6GKgkDguoG7HWo9qML6GpCmQypPj90PIMBvyVDB
         W8CVfUKXa/izdAB0getqF32MNfo+nqKaQKs+pxRdNV/Gy2pCkxvKLqDswZoMe0wCNrdT
         YZbDmvm6UFhoLSdBdCBK6L/BEOvF2TB8BCGfpqHbP6GTzhLp4m9RIm7mG5l/Rgy2R6AB
         dNtA==
X-Forwarded-Encrypted: i=1; AL+hErFf28sByLWW4yN/pJAUcYCrvjzGvSp/7zFn9VT9N+JdIg5c8kvbLTijxUbG0EFSGFZLtLwcODeKitUwdoH+0how@lists.infradead.org
X-Gm-Message-State: APuU4Z+fwBMcbMdvQMDtUygSePd8KXqocggVmaY79Bi2zJsfDo+kfgRu
	6o/gRZ60WAHSz1+mTYUwQ30Zm1XvSGcS18h4EB7l8Kyb6qrEBH7t0wh2Jbr1OXpQAyiTvfN+clN
	9POcoOUYcmr3TfKzabOYbFFpEXtoV9iaU9kjvsU+U7aYe1PPZyJVkQ5ps5ILZG9JbaoiLCaGrDE
	UT+Ap45wAaKQ==
X-Gm-Gg: AYBFou09BWis32b13m9OQPybZqlbaNNKIlEFai/9VbfgWn7+4FBe6w93f4clxCcI/pd
	JpIBceXxdaRBAvPp+on+VsKM+E6VZA9uHVq9K/HvUuxjEg1HyybHW4TxUTe6XpX4r6To9lkVV0Q
	29QgHKYS/mVB27zbcsnubrZSm7vSY8xN4cl4sqzRgqfUeczpyPY/b1ZW5BwPY7FwI1X5qQJ0rE+
	UXCX+pWV8Fp/YU9pndsdJGDYULDHkqKM8vkJjpS2F56WMyJJ1Zm35uHafMHlPwA5ycyKLppFmhL
	i2tA0cDNB5CnzalCjK2XQ6d/+jb5L/lzwbo8gmxFJgbpzlOAvsaMV+htIoYeZnb/Q62MU/fepG5
	JqquJR3NYwYI2Yoy1YXVNl4hPT26M+g8JRdAth+4kAHj0j1B4M9/+21evK5G5+q33Hknb92OvX3
	zqAjTtBM6M7XyS+RCdytRUuWt1JQ==
X-Received: by 2002:a05:7300:d20d:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-3751fa3d46bmr785347eec.34.1794262063180;
        Mon, 09 Nov 2026 14:07:43 -0800 (PST)
X-Received: by 2002:a05:7300:d20d:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-3751fa3d46bmr785302eec.34.1794262062597;
        Mon, 09 Nov 2026 14:07:42 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm1256570eec.24.2026.11.09.14.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 14:07:42 -0800 (PST)
Date: Mon, 9 Nov 2026 14:07:36 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 04/35] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <20261109140736.00007915@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-5-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-5-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfX7FcLVkKDRTlX
 ebjFKZD57I3MN6t8hQxSCJvymSnX1OqI3dyA4lTIqiuhzz+0rXwEjpdKj68LeYaanKWgmehRPob
 SCLGHTEZs4ZlGZ0Z8ah3HFGwlRVvNLQ=
X-Proofpoint-GUID: mLE2IAovlFnw5r9z3f46W7sBFrXdC9xN
X-Proofpoint-ORIG-GUID: mLE2IAovlFnw5r9z3f46W7sBFrXdC9xN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4OCBTYWx0ZWRfX11xcG/1ySt7o
 ZlWGRVltB9XUH9wdKHcdgaMdEyghSVamGXcioWrZbpv9tkFP5/RL7lhcYoAyE6r7IjYFtbXxPUs
 smCgx4nj0UpY/y6DjzDobcVaN4dJHDox/KLtjVvwfOAB58cSPSQUnUVLhqQSBkU6OFBKhL6WAcj
 gxaO6oq8iNVhYLXtIYoequXX2Zaq6Ra5ESqShpY4DxlIGngFCMo5qxOX4AvZWkAc6w2JVLyX87s
 zqAY+Xdir5CT0q/2KOXsPA1szQiJAd0BTWcO6D4iV2nV6MZetWNUipIQ2YUAqeSZms0d+41VvcT
 6r+huD24vgGLr4ny0NUq5fbXpLLgkDWJombT3LYjP/XhdblBqb3dMeh0MsNAogK7I+VqfVjZa5P
 ZYdhSAVKsQ+PuFKUhZQ0BV3wVrceCpx68izSnDrwFj4zJzZP57A0jyJEW8/cyuRxY0LjUn4a2R3
 tB6JMfqm91d1mCElKDg==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af24430 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=4nPJYbkOPloEEcwyAJsA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_140745_808541_4D450F5A 
X-CRM114-Status: GOOD (  25.85  )
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

On Mon,  9 Nov 2026 09:11:50 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow protocols to register events with build-time unknown sizes: such
> events can be declared zero-sized and let the core SCMI stack perform the
> needed safe-net boundary checks based on the configured transport size.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v14 --> v15
>  - better commenting

A few bits of feedback on the comments.

> v12 --> v13
>  - improve variable naming
> v10 --> v11
>  - account for ktime_t field when checking boundary
> v2 --> v3
>  - split out of previous patch on protocol notifier
>  - use max() instead of max_t()
> ---
>  drivers/firmware/arm_scmi/notify.c | 28 +++++++++++++++++++++++-----
>  drivers/firmware/arm_scmi/notify.h |  8 ++++++--
>  2 files changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> index bc046f2f83a6..a30589c9b377 100644
> --- a/drivers/firmware/arm_scmi/notify.c
> +++ b/drivers/firmware/arm_scmi/notify.c
> @@ -595,7 +595,16 @@ int scmi_notify(const struct scmi_handle *handle, u8 proto_id, u8 evt_id,
>  	if (!r_evt)
>  		return -EINVAL;
>  
> -	if (len > r_evt->evt->max_payld_sz) {
> +	/*
> +	 * Events with a zero max_payld_sz are sized to be of the maximum
> +	 * size allowed by the transport: no need to be size-checked here
> +	 * since the transport layer would have already dropped such
> +	 * over-sized messages.

'such' here to me refers to the first bit. That is, those that are "
sized to be the maxim size allowed by the transport.

I'd just drop 'such' and have
	 * since the transport layer would have already dropped over-sized
	 * messages.

as that avoids this potential confusion.

> +	 * Note that, though, while this protects from buffer overruns, it is

Drop 'though'. Doesn't add anything and leads to odd flow to the sentence

> +	 * no more possible at this layer of the stack to detect zero-sized

'not possible at this layer ..'

The 'no more' refers to code that isn't here if someone reads this code
once the patch is merged.  So if you want to refer to what changed, keep
it in the patch description not a comment.


> +	 * events corrupted by truncation.
> +	 */
> +	if (r_evt->evt->max_payld_sz && len > r_evt->evt->max_payld_sz) {
>  		dev_err(handle->dev, "discard badly sized message\n");
>  		return -EINVAL;
>  	}



