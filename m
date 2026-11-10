Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B211606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 22:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KUA8J6J5;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DAZ4n8Nf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwfYYpuu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=; b=KUA8J6J5mVzV2z
	HBRzoEwJoRMTbnchmZIy3+RaQb3LxPTL/yaRmKOb9DQzOmEGrnLCH9HoGJOCSDfPV2qA0qI14l0ad
	19fLwbR9h2d8i8ji5+9ap+HQdl9QrIyWcVlEZI0AwmJuNdcnoWSIek9Ctsg/Dq/h2nTFnkudloRBO
	CmBTbMo84+OeFniV88ihDt8ZH9dWgW84wMwRDqGVqAEHRc/EL2ZehVALSU/Gj9ltUuYvgZmC3r7GA
	NZMwPmt4Df5+U0osbsrICzQR/UtJt9cSER88/f7VK9HNW8W8Nv+m4hl98GqalH9ze308sQ7IVGGlb
	2JTINt3aFQ8p76uigaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuQQ-00000005Ac8-35DL;
	Tue, 10 Nov 2026 22:34:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQuQO-00000005Abh-2kdh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 22:34:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKcgD443765
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=; b=DAZ4n8NfveJRN+DB
	Z6DoHMAXwsKCwN+7FUx7rhjwPSFRNim82pOhUdcoLn7/CnwHW/ITl3U7Ee8i/Mwk
	e9wk7mWcjGShg0lOfnvU35X0c9Vl9imrcTkmwZ8BHmLXK2Zdkmzn0rNnnUMn5fGB
	l8QV59zgmOgU9IQbJsTfTBvIDdCO1aUWxUuVpeXY5vIIooYlKxJXrUuMIjRzeO4e
	YVG/XR0BEo2w8/AdnVdHznhEBbdv1JNdXjNxjEOOV8rRzuRV7VPgPPFK85ddBF+R
	byTC/t4ZBoxSqgf0drJaTfjdtqprj+qaJEYs2XrCVJFxcJuiJ04rFBmljglIHI0t
	biJ5Dw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufu68e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:34:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so4115393eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 14:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794350083; x=1794954883; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
        b=EwfYYpuub1eKF0ipQdmRmboQm6agVSTcJCRzsAqgcSIfRmWFVOdLy0GfMzvHtS97gn
         fttGLxEqbVdULocctSc/eqZenMI3kNMI7m97LtEs/seuds3PkuAKJ/Du9Omsl2X/SdKN
         dy4ao1VWSf6LElyuk1hNW3Tgif/4ul2XWF52ynIdi3D29oUNC+P4kmSP9vI91duRtDAN
         soccCJAX5M0I8DD3WJM8fBkhw+/GPit89ylddsTVZovY0uBSawEwxQ2EyRxNvawRjqFJ
         Jo1Jl4fWu04TGlnvK8IK7PFxnPirqD2WvyaiPAH1P7Ji7aog/Xgcz63YaaHtz5IbBDCZ
         Nk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350083; x=1794954883;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvL1zYmWG1e38nSpp9eLWnXl9WrfBht/vX1XlfPoCws=;
        b=r+Pjzlo/uaUOLHPnZiLtQDyNEqMaVmiiGwKe9p1UGUNyshpix6akNsY7OJ7oQa9kX9
         3o81zoy35Oo/50uW+3EiiyKkjJLc2tRYRfdBDkfhhjRBDRhbRUVoIscOTYeTswSmSqp5
         LmmFP0qdD+oUZUxCPZ+kAnsADzehcLeQl4+G+EM/kx/iKPAFOgiBDwTel4H4NZZh+YQP
         kLcRU59YPvr9WuoRNHQiWmh7oGDydjdbvKQ1MCJVDRVVFtX2z6rFOet8dkZ/1idX+S90
         okpRAM3e26prGFtFKBQxAssO6CjX01cwcX++kGsmQybAU3vZVp8FPVDEizkhLKg7Y4Jx
         dp/g==
X-Forwarded-Encrypted: i=1; AL+hErEH+Rc4pvmY/AqZ+EJjRKp4SVyYVKdNI2lO1RO937w1RKFeKyK6T0/+XOd1RajsmHyVsi3OChbyhmX8/gyaIW7W@lists.infradead.org
X-Gm-Message-State: APuU4Z8PDwdqn/IbmiXolvPPixsVWvoqrt0MdI6tI9d2bwVM3Kl0/PL4
	KCRtznD45mCjYVxQT+LpLR5XCKh4UqvClXUcMDhIsDE5v/Io9HSdnUfjN62m0ssEYxYjOBDgZK2
	UiL/EgzE/RmtybdWId5RcRpi1U79bZ6KYcm/zuQsMyAT6AslxUuHUPAV4fPqNy01syCcyNYChna
	PobA==
X-Gm-Gg: AYBFou05MKv8GcmW5jhB1afgiydztMMiCQnQYIV+oHgm4IZ8Kn1ejX92rceByJgxR5q
	9KItYBGVGNa92KySf0i4Emq7GSAThI+0HXw1uvtaF8z9PF1nYPqQ/5Yh2bA5YE76ljgq/sXjcuf
	6WvAsP3yYuUhU1ygrgaXrgmUX3x7uWGy5TqnJczhw2PnB9IKzivV/kJU0qKyMiSLluVwGH+qy03
	r+JaJIEZXOy6rzdj51uUDYoovh6z1dmC07Bsy9O4YCO8/0x6U4HQUNkS7P0PxVXE6BCbYlluGJK
	SOu+YcVh4DmCjxZNh8YG98oaoSi+BWciHbqn80iF5e6LPHyIh8PKx/ih83DnT69E1MJE/82avBN
	PmpjxWnVWAtiYG3wgpaKOtoyEl+9CKuW4ZRcsHaTGGtGPtheDR/lNPz8ZBUM1C7SV4eXU8Nieln
	xShobAD5TBMDBx6XGAvUP4Va/Z9sU=
X-Received: by 2002:a05:7300:509:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-376854b98afmr1391399eec.12.1794350083196;
        Tue, 10 Nov 2026 14:34:43 -0800 (PST)
X-Received: by 2002:a05:7300:509:b0:376:2e3d:7c62 with SMTP id 5a478bee46e88-376854b98afmr1391305eec.12.1794350082385;
        Tue, 10 Nov 2026 14:34:42 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375215d8889sm10389393eec.27.2026.11.10.14.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:34:42 -0800 (PST)
Date: Tue, 10 Nov 2026 14:33:56 -0800
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
Subject: Re: [PATCH v15 22/35] firmware: arm-scmi: Add Telemetry generic
 event support
Message-ID: <20261110143356.0000451a@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-23-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-23-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dw-i7iGzDYcYYoVTZpDh0epWXCbYaUEJ
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af39c03 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=7CQSdrXTAAAA:8 a=phf3XAa3S0evUxb1xUUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Dw-i7iGzDYcYYoVTZpDh0epWXCbYaUEJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfX+whztQf1JdwU
 5+x/f3EUYcvPg9Xm5uwRei/0VOKdT1GQjzYM9tiRX5pDJs3tY7TYoNvUcn1U5N+/SUNls6ecKZ+
 Q53vBVeDbWCrnzEJXhHJRN3ySRWiO/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MCBTYWx0ZWRfX3/LeNjThT5tl
 rOshIidUdtMQRDBKuiQPUme0c55xgZWTpY7hUL3liQe1hRkUeuEOwpTaRCQNjb/YBA19QGzNpCK
 aT6kk9+U04LldeEG3skuvke1fLhI1HSjoD21vHjSz8l4PePIxQJHYcGwYBWwdfYbA+vl84q6yk4
 WKrbRIcXkj0qPkXoO2J2FzeOttpIm3SekZJ8UKFgzbdyh5PxhPnm4PyxIBKgPU+UMo4lLh08JpG
 tcBlSFilVcd23mkRxjCRjwZ3x2Ab1WvLIa+r46y0SP/Tx+bHEEovWDqJWOM6ehJPX/1FrcMmaGq
 ha8A3z2N/4+AGX4AU4CbQz+OIG6MUUL2VTWvU5D5/IGRQHbtlmw+7JhcKLpAPG578ECCrhR5kyi
 71/yy04j7FJJzkCqm+uuaAkRJFoPIrsmCFW3Mh+93/B1f9JMDzxbFJIf8Hw8jzm3MTEgCINlfaU
 Qx/iiOSz4EdgxAUrYSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_143444_707017_ED74653A 
X-CRM114-Status: GOOD (  12.74  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon,  9 Nov 2026 09:12:08 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support to allow SCMI driver users to subscribe/unsubscribe to specific
> Telemetry  abstract (non protocol) events.

Bonus space before abstract.

> 
> This enables SCMI drivers to subscribe to available events by registering
> an eventfd context that the core SCMI stack will use as a signalling
> mechanisms. Still no real subscribable events introduced at this point.

Adding a fake event isn't that helpful. Just combine with the next patch.





