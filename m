Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A218606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DV+mKkwn;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GsfkK6HN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hdtsI2kq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=; b=DV+mKkwnH+65kn
	FAJoW5X1OR6ZOOQwZLqbuBpL2JbdU8o6jEyUytCc06KsefEOWjqj9IgdTjmStp5T0D4Po1S0K1XTQ
	+qlJzfAsq3okLzTMYlQfz8IfPuQU9QeJK8hxX1Avt4qLSvK4mox4gWOZyo+22a43bn1XH5PYWGehx
	gx4gl/7QaTfldSmP1K18FNVwOh/2dTdSL8nPURwW0zgDqeC4hTaXxpaXgCW2qloYMIYQwbr20RDlW
	jlhcmF3bHe3pTmieMbti0OyxhmoOlyHDKkhvZddxK16U9Z859n0ESiRmkNVtQrkxhzhFr1RLKnNnE
	CGysLs/rU+aptBGCt3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuqp-00000005D4G-3EpG;
	Tue, 10 Nov 2026 23:02:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuqm-00000005D3t-0w1D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 23:02:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKoVF486731
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=; b=GsfkK6HNGbcHCfa1
	KfU1R0dcCTCdE2EVDwx4d767g1MGETijAE0LOpY5jU1I6jk1f2oiM+FT7GSLSAEh
	jPr85T/ME9YsWHiUx5Ta8628FoLd8o1u+mAtGQD+hWEIbs8XMJ4vzurJ5olSaT2G
	tvtbGu1h3xmOP61sHC01yj/xR0MhHZXX+6PHaTBZ0acB4FeczGO6/brYmgvAOv46
	RA8h7TZ8WOgOfLHb3zRccAsPm+bSxAEhEzMmCIpbNKycqul5io3/w0AJ4JyGzWL/
	WJnYmZLgvA6Q46doauKWVEuO9UokSIIC71bsyAGHZhXTGzw6iPSmVOJeMUYSLDFq
	mTmwiw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdc66f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:01:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f479b9819so4541454eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 15:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794351718; x=1794956518; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=;
        b=hdtsI2kqDuctycoB6vXvm6ymqx0erIY53YqwaWUkhT/EYsAtudr2e9mhjV7LIXw9ZM
         RuuFdTZ+52WyvCAKGWVyPlokE9jJQ1rTRJzfJF68TS8Uor20FSmNhjySd2XSt/vnsV+L
         JoJ9qtXJ44TSbV349TUmq8MFU1C2BvyW33CLCVfq1V/HFMVTH5tuPA+nKQQp4VJ+DR7v
         Ql1oxQ166gw51PiCOmPeISMiYT1zMbe+3aBFbRTtg41n3nDxyNJOsbJ/fzIp2IWko63h
         oCC9FYGWS1m0TPvmqvQP9WMzah1nCeFW3uak+mjtqhPIXQrT16MrX+49k51FrSy0GpBK
         YASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794351718; x=1794956518;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x99lRuyCSocza6M3mwe4fqI7W2CsKlaKidC+6RvPLO4=;
        b=1aGNq30lcnYFUogIjdLfVZgqgpH9tLj4odS4W88XmRkJ6BX2VZWotTQ73XFie8ZawX
         Rensk2oZHAbX3ROfC9NqGkcm+5s47qHaUEhtwc5d8gfhs7hfFC/4caOniI/e4BQXZr1B
         FGam9fEIBiI1a3qwDAS5tkOa+iNG++u/gH21z6QnKEHBp+ewYebz8j4nTYsMLTrczXDz
         eu5foY8ZU/M7b1r63yonndf0J9Nykbo2nDkiCpPo1MJ0xKAbWPhlhyCdJkDRUZ+/GeMR
         PtUic+71NsO9jAi/OLJJwAj/ril9XBBknZ8OHudq5zIC6DuNX1lDlLu1vmwyy4PZzZd1
         J7yg==
X-Forwarded-Encrypted: i=1; AL+hErH68Sl/JcqhHmlgWA2nK4FYREDVdHxR9l5DDvAalvr5F0QE2NdD5ZTnosjlIjgZA2unmZ+e/E3a0B9gIGs4AQe2@lists.infradead.org
X-Gm-Message-State: APuU4Z/lJGtXdohucS4M2vgKjatLsv9Sfexng/meBYIwkjJKyhRDYNXl
	dXmwBYQWsRPwmqC9vEwiikylIvkbh3zcw9k/+uDqRGpzqkLt/vmTc6IDK8CZKjl/O1IFHQLusNe
	bVKnucGPyLCQcPAtU1dtd9zfO7dHawLLL0iZ5Bq2jzABFloPSCoNvhhhQPXLFndKZynTFY3AOvT
	IMEw==
X-Gm-Gg: AYBFou04k+Mv4UZt5Kjr2Do1MmJw6mQZoTfi1iMFobzfz43GLq8YYqVY6imInSmv9+n
	SGHaNHbh9gPCTxgM0xbpD+aOc0VojcFTSz0KQUpqII1+Cv+VY86MMlibTCeVvK/x4L289ToIvF1
	czhdjrB9qoUJn+kTdO575US1+BaGQfOq+CjSiS7VghJ0DJK8CTK32uccs5RmcDsrX+IllRlxAeF
	d6vmmLo+YNQQG+DMVqlQaFN+TCpXOs9zEoGQvZ5OkU6dnOckF7IzpyqW732Bz6ed9ahny8AEI2c
	wnGR6lCJx7f6vA2WYuCSmAk5ZIp+u2SNpp7U5zGXRMV1ccdD1C0KZMP8j77lOR1ZD86VAH+S6Kh
	xM2XrEBHblQEwhPtPJWYALuQ1XHeUmxOgwX+gFMQV135wmfowNkZRCJ4PU9+xdeQ5Y42Y+y77jq
	8lxjuhyBSAUwpQ6EvaRn5ds16lnWk=
X-Received: by 2002:a05:7022:287:10b0:195:9228:50a0 with SMTP id a92af1059eb24-1b3c035325fmr481398c88.42.1794351717642;
        Tue, 10 Nov 2026 15:01:57 -0800 (PST)
X-Received: by 2002:a05:7022:287:10b0:195:9228:50a0 with SMTP id a92af1059eb24-1b3c035325fmr481344c88.42.1794351716979;
        Tue, 10 Nov 2026 15:01:56 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11150sm13944465c88.5.2026.11.10.15.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:01:56 -0800 (PST)
Date: Tue, 10 Nov 2026 15:01:21 -0800
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
Subject: Re: [PATCH v15 28/35] firmware: arm_scmi: Add un-managed methods to
 get/put protocols operations
Message-ID: <20261110150121.00000c6b@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-29-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-29-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9ZeZcrLZD3_FS5Uy-FZc389HGHpfkK51
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX4jVfHe54QesK
 qp4BbZVRwORUWojg3uLFEMo7S8GkdQUONSbcd6X7uKveFfrLDxngZeDXi3zOLsCewYyBtGeJP1o
 HILmWOGRNTgjh7YN9vWS+WiWV9th6/Y=
X-Proofpoint-ORIG-GUID: 9ZeZcrLZD3_FS5Uy-FZc389HGHpfkK51
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MSBTYWx0ZWRfX9iYcQ4uZ67L4
 imsMkAifG/ocXqmpB5I1PlEloxIAcICT47DbbbSZAlaaJuh7DBtAYuiTZ3lRRqFeot+ZOGmLe3+
 XvUKXCyxzSykqk6Y+xEJW1iQSoW67Ij05C/GbrcsI2wQgoc04fYHK/G7IMXlO9cqdxe62y39CBI
 9bi8hBn/KnzZqpacNo/4DScTRPXZfi8wGG3XGo2lYDB4fTypea4Zqyt7vGc8cDBQhd8DNp/nG4W
 5VnwENYfe5XCkTN2neKHVQMNmAMlME1PGMzgJQeN2oLSYvC42VoOfFOJXrs5fxx8ZAwK1c1P1If
 UNdLuufzcwvMzTT7baQxDJyC9ae6sm+22Cj3RGFdAlyjcUBdTiW28pK5RoOWWzQcQ90zddlIo3u
 mJ1tRvDp5QS1bvfnCA0DGe2mEc4bz60Uo2AHRo14tuSzSY+xVSokqKO6jN1LKi1zR2kB3q/gy7K
 f/IDcO70xdTzLfQuDRA==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3a266 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=JB04BPaodQz_QRRZ9pYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_150200_441276_92756774 
X-CRM114-Status: GOOD (  16.81  )
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

On Mon,  9 Nov 2026 09:12:14 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a couple of simple common methods to be able to manually get and put
> protocol operations to address situation in which devres managed methods
> cannot be used.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>


>  /**
>   * scmi_devm_protocol_acquire  - Devres managed helper to get hold of a protocol
>   * @sdev: A reference to an scmi_device whose embedded struct device is to
> @@ -2697,6 +2722,18 @@ static void scmi_devm_protocol_put(struct scmi_device *sdev, u8 protocol_id)
>  	WARN_ON(ret);
>  }
>  
> +/**
> + * scmi_protocol_operations_put  - UnManaged put protocol operations

Bonus space after -

> + *
> + * @handle: A reference to the SCMI platform instance.
> + * @protocol_id: The protocol being released.
> + */
> +static void scmi_protocol_operations_put(const struct scmi_handle *handle,
> +					 u8 protocol_id)
> +{
> +	scmi_protocol_release(handle, protocol_id);
> +}
> +


