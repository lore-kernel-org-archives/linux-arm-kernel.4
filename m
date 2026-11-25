Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3771D606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nV1ZnBGD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mgph49aC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gr7EnGq+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=; b=nV1ZnBGDeM48XR
	6k/jqw9XshAlFXO8Spfyg7siePxEXGk2XnGGXTlsgCtjCv24262e+cCujNc8y6kFyflkllTWF7w1/
	XFkUZtKgom4s+e6BZ8pa6WmefAKdpxkzNC28WSz4mTdNkKmQpb2Udm/BeGY5sCSnwlpSWpRyd5KqB
	8ooKI8GcUjrYHR/jqWCD6rCpsSVPevkP9/Ly0Rhw+IewL1S2qY/DTqFkWGfTxhxc3vbTbQdbazUNL
	F3qNw8+sj2oHtAnNA6vWG2IkjVFZxeomgQ1H7pj7tH/9SrXcKeM94VqwBblvN+Sq/T/KjjWw+Nh+8
	q9IajOI3cUqrASVkhcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDJe-0000000A2OS-2iSb;
	Wed, 25 Nov 2026 13:45:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDJb-0000000A2O0-43tW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 13:45:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mN8k555516
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I5CcyHsjMPR
	sGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=; b=Mgph49aCrmkJ6eDtCJLPb1VZwwq
	213BhbodPXryHdS+JDlqE5OPay/ybzN1/8q8Uk7nBVUctMWKncZqyvko2dbKnT1q
	loTgaGadTGCh3T1E1jGzm1cQZ8kg2/+HMsmg7X7dmLypkdHY6C8z5P50OkpwhuMc
	HJp1lbH0tIrMG0og9wDGbthSO3IUqjhXO9jc4KBCODXwgK0Wm7I33zXDnN3M8doP
	EbLfyMNKIKk8o4Lf1/RwwYMLFxfnbGbY6zVKKafSljQiWxk8oRGXUb8UJKAX6v9J
	7RxqjJQH4BefAAZTqsNYC9PRUMgW3fclDU474NI0HrSHnfu3IoR+Fy2cWNg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvns28m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:45:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ac448cbeso32984eec.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 05:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795614337; x=1796219137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=;
        b=gr7EnGq+48b8Y9rDxD7eaD103McAb+qR01RYcreEO29wcO4CuJLRD+F3A12Xqf7M+I
         vVX1yjwXq/V9hweRIDnPZ6rtfGfj5vppuCYfO8UlSd7ZjrvkHz/rLQ3XZqLfgAf8pXCc
         iYj+yIFElbvaTy6n1IdrA1EnHW6jIVxXM8Pm4U/tYCNQL+ZMaRJVZsVFyC2AHdqH8AA3
         IQD8+i/AVMD12HONO0hR+lxUkAP4yvaakmsR9IlxH+ZmRGsABV5UJi97IBZzmANyLpWn
         6cFyA8GGlJ9SWkNxbcw50wf3+Pj1SMtYyiGzUHzA+sFIg/a7YzTi5h/Ie1JDqI1kPuwv
         Xl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614337; x=1796219137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5CcyHsjMPRsGo6MKL1jcfK65/L0dFfy3XsV56v5xI0=;
        b=0Kq9bO64dgyWXYvpAx5YzIENkDuO9ffD9DBZ0OD50Dz2hWWZMZt2lRDOE6nsRfZtXd
         vp//ij9oxfpTQ5euuN83AQz3K4h3hbmtdGbBHCqWrw8LgW3WglQOk6/6ZuHqMnSigvI/
         NgJs6vBMEF9Qe2BwNprkF2vifzf44WhoYDP5FWbwHWlssMAdX0yQli/tW5LmIhTRcACI
         5299HXDHfl94gb8y+zV1ycgPb8hWeZCa/uwsa3Uexyiqbs3rixuxj4SlrSPIEoPst33o
         Z7DxCAuYQBOvKXkg4bT+o5tckZeLwOl6lBQMiaS8IXgsxUOoUN0W1G8w6Kf7Kq8Ml6Xa
         auXw==
X-Forwarded-Encrypted: i=1; AL+hErEQ82qUF98RDZv/AoRZiGex4CI4sKggPWwQVdgpRqw+bzRQtsiOEMgUdp7hMQsx74CIW2zHRZGUGWhT0tvRGOdl@lists.infradead.org
X-Gm-Message-State: APuU4Z9GjtXCPEA25IV3hr7Pzp18i2cOuAuO6ZFvYwCejl4beIpzLT5k
	fH92ANJx+a7jHGDNsmY/Gblnls2yS0AKagqXs8ePNvSxoWt4k+C7mxO4QR30PnJcWpLvJT474AR
	e7uDP6PHvo0j1K+lqDzJAC7kKXMkA3+q49IvqUJ1CMm2MSkPep6NZPq0MbxB2jLkr8KZ5CACADr
	SWcg==
X-Gm-Gg: AZFdTZfWQOHLc58DyxV7AqTpTepykalvPOYWf3J9/qrsuxYdir4I7UGLEEdaVpWrUCe
	MDAgBjI6xcJuNEzVA2MYmTWi6VsKcXBtf9BbGm2ODh8twvRM/n6BX5tQl2F4NvOcB/2f3T64T3I
	pLKvgWEijoD6kTi075OJxloZDwnIz4oCPmgtS/FRmz6N8wQfzt3OwH+AZ+91KXTpfS5EaUZqnoo
	6J4QuKnN0RBRsk4YZ9S1Qi8wIasFtkfvUX7uaQRYkuDXbDAu6TP5uDZh2EkuikmmslVhIX1bxHh
	dNNTOlL2Er+RxumXSNwaXarcMyRlBqJ237sgOjbnS5khXO8ucNUgUFbrs90uHbhoQ7Nz/L4+H9m
	wdJeqKJSVlctp3q2YuQvikQUqdEzVk75rKZImHvlAlKTaNjNimSbBTY0Y0LF/tSxbWMn3/Q3SuQ
	DyvVqUeHL1F++sCE2E02m+ADjoCx94RkAvHj1RMowSZ0o23iRYw2TRXIm0Ilyju9GqSw==
X-Received: by 2002:a05:701a:cc90:20b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b5697a0445mr18891254c88.1.1795614337114;
        Wed, 25 Nov 2026 05:45:37 -0800 (PST)
X-Received: by 2002:a05:701a:cc90:20b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b5697a0445mr18891175c88.1.1795614336326;
        Wed, 25 Nov 2026 05:45:36 -0800 (PST)
Received: from hu-ninanaik-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm68870217c88.9.2026.11.25.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:45:35 -0800 (PST)
From: Ninad Naik <ninad.naik@oss.qualcomm.com>
To: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pranjal Shrivastava <praan@google.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iommu/arm-smmu: Use pm_runtime in fault handlers
Date: Wed, 25 Nov 2026 19:15:27 +0530
Message-Id: <20261125134527.2427608-1-ninad.naik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
References: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1NCBTYWx0ZWRfXxxKUFb4O27Ki
 EkE9CZZ0ujrA0AAXkb5eP3bFUNtlQ1eLP1Vnty51Av6wyktJdyhSN8P4B0iIO8IHCtVzLWHB247
 8i8lVLSMWfVaM8CzUcVVSf72v7gjC1jfa2FtByW9GCufK6bihE+s4VfW8gFlI5gsPLTcTdVfLZc
 c0ncqDDiDaZRH2MZuKMJrsHJL7KFXG2qPJItRKfcOsCszeQ17kC01DUzhYHb+4b/KInc2Vjn/y4
 hHa0E8/ntUaWiMTAKpmPBPDGkN5ys935j7UwqGAxTIb7yuVTWiZidxSoSX7PClajTKakz+BGvw2
 r52hlv5Ct1bgMDoWxr2EJv11kYgkmTJYTOioOWmMTDv/fEGWPJv2btHNjQrT7GEIX9Tw1IFtxGZ
 RziTL+cyVKh3545VqHeSKia07qlkav5xq4VyLu5M2Y07vATdVekI0Je9OpF5/mdjsz79CY+dgjr
 BrqA15NxqVClq2dudSg==
X-Proofpoint-ORIG-GUID: lcsTT0O6UuiqthdrkXIyBH-zy84ODMLL
X-Proofpoint-GUID: lcsTT0O6UuiqthdrkXIyBH-zy84ODMLL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1NCBTYWx0ZWRfX/cKkVZtqojT2
 JN1HxRCfd/PP58a83Y2Z4iz97j6/YXo3c1liaRcKFEDV033WI+pUC9G6UojCpovw6VgGxCAPPRN
 hQlqBEMsqUn5KYtz75qAar/hW4D4eVY=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06e682 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=zxn-vXfs4R3W1Tx4-PcA:9
 a=ZXulRonScM0A:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_054540_147067_BE4E2CF0 
X-CRM114-Status: GOOD (  10.82  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Aug 06, 2026 at 03:52:41PM +0530, Prakash Gupta wrote:
> +static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)

arm_smmu_flush_iotlb_all() needs the same treatment. It's called from
the iommu-dma flush queue timer, so arm_smmu_rpm_get() there can end up
sleeping in softirq context if the SMMU has suspended in the meantime.
With a firmware-managed power domain the resume actually blocks, and
we see an RCU stall:

  rpm_resume+0x18c/0x768
  __pm_runtime_resume+0x50/0x98
  arm_smmu_flush_iotlb_all+0x94/0x118
  fq_flush_iotlb+0x3c/0xa8
  fq_flush_timeout+0x54/0xd0
  run_timer_softirq+0x28/0x50

Skipping the flush when the SMMU isn't active should be fine, since
arm_smmu_device_reset() invalidates the TLBs on resume.

If this looks right, can you fold it in, or would you prefer a
separate patch?

Ninad

