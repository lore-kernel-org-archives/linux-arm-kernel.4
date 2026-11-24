Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5DD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=srFieXu0;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cAqieYB9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HPPIZKlm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=; b=srFieXu0XNnx3O
	bpOpHfqEsVEAm58CKgxPOLURh1tIj9Iee2IRPkE/SXPQxuLRKtr7VQnPtVN9ZW16+7CfxuFLw1HA/
	Xz6JSR9A+FImCrLetmUpYoOYMl+3isOvngI9QOMZccKij4yVEyNPEmlvINNj5ZX5KSc78L0CTK2zH
	pS+yNMj8WWGtsAcL5MT/zh3sM5BryATlAZbAV9laHyi5B/Ob8BEUVYQ875RmkIcd3cwSTXY6BkQ4Y
	wNrP55CAjxy1l0jAuTctMngjnS35B0ErdsYN9uA56E4uH26a+AiGmNFUZo1xk+po8jovBUHL213ft
	LQZbTgcUdZ59eb9JYfbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzOn-000000082Ty-343e;
	Tue, 24 Nov 2026 22:54:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzOl-000000082Tc-3RXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 22:54:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMaZC51654136
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=; b=cAqieYB9PYXK9wiS
	seI4bz/T3gnzW8qzi+yuIyLTRs8jAWSgvmQkufQpgBtfBxkLJFk7SIYbHC/xsbok
	jh6Msd7xe1jvC8KyRKH0EsCOkm2u/14MD8HOm+mw7+B4PmlzwW/X0/FyPswwznvp
	M8uZnBAla1Oz9CrtXeu8hrpOZjFkwfd6NmyFCv+xR2xqzcaLH8v1obEaeWIhYvUv
	huLrIDBuYIKdcJzADv3LtdMzcx+1GC97fgBodl2R8ybzthWXaY3xPDXtiLTMhJT/
	5kjNwI+SApe9xU0IYz3pjwelPKJZDQeE7CuMeJkIa2ky+jd71nh0zPMylHIISVoS
	5W3eYg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eyd97h8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 22:54:03 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so5959930c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 14:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795560843; x=1796165643; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
        b=HPPIZKlmXnNj/cwhv1GW/pKg70SvyZIloNEZslPyT4tjFwAYeeNlbPp2V3IVkwjaV/
         +Q++9Q9YIub2a1esKL9z5iE5Y8zQuuL1WGS5lzAWgz0hFv59s+6DxCODplvGhOxZPRS/
         2mHV5Xe2R59gLqOAUwPYrjw/2EVs092lplUrpbGx/bZokN8p14lovtnV7DvzzD7DkgaF
         c2kgDn7dey7mONSMtt/9POPhlfiYmdYVm3SQ64Q0x8CRo61CgOYA2PIHvu4hAXWQleG0
         uF53qK5N5mlZVK6+WfiYf9GiKF5TYQLfIy1+SkgOb2M6WE0lPwR5MeGsG6qI3FUYItCr
         YqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560843; x=1796165643;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMB/Jny4u3WqVurFKRqFAqz/mYflSRmFYQ6ksF+dO8w=;
        b=v4aGOPpZRkUTodU3AWuScJEzza1zwjYo3n+4sCRb9aUEeDEuU/PNMTheFyWyaJOeA9
         RRwU27Q6+k9GpDME5cRwYJup/XrowvKAmRy/kPJSbBtg2TeI7Au0HHMB0iR+RhmksuGO
         O9TMOBzZTXxoXcfjq9OBXmWxOnW8u61rFN6pw91XAOykJTFuPQqVxP5/GtQIpVzy227E
         rWG+mJX0QzMeWPKNf5Y3F4ASMVFOOVYDBpkuET48DOxQH+H4oB/gClU78W5BDJp+4YLZ
         YDQBhY+Wr2myolW9/p+HdBlFO1hZKPJXRrlMVmrd96aeShbz5cpIitkmpSCRSe9AsedR
         fHuA==
X-Forwarded-Encrypted: i=1; AL+hErFl1lkB9bi/dCPlWUVEXrSKhUL8NtRX2NgdOTq1ByKVX59LAkUqxsw/uVo6qAacP8seUvSv3wjMCKrA0c8UQe6k@lists.infradead.org
X-Gm-Message-State: APuU4Z+TX5LshhuWA8XEAX11WxAb3ue1zV5TmHt3TYFdO4cP/dBkB7pg
	fAaIG4oSs+dd+R5geQ4b+JkQ18IvFl/aQNlRPRHINQROsHaLeGwEi24zTmBduvqAgwKKosopcsd
	vW+JLVsFkZpEfgnqH8qMtCUpGcTSGuiqXx4jY277yTXBzURgOryHfT/ZGf4h4/tYyGLz1L4hcUI
	iIezqBL9yDzw==
X-Gm-Gg: AZFdTZehEzTkDWwyEmnSpiPA6MtiUBd9RuE3s63nKHBominpNjwer1U9xxMO4FAUhvh
	Y3cMDDk+5CSrWObemvghhnyzrNgE2AWB1A//QkNqaM7rcyp2oepwsuzQ5TkFftIIuwKcYrqEOQ/
	rV+f8bnGgM8h0ULGrHo2rVe4A+G8jwGRYd26nYQJqQ2d/dPhbF0LrojuNzOGZkQDuJKZuob60oj
	AC168u986ueQ/9uWqrxKcedjRFoTk+vV5OR2C8z/1JUuiGIdst01OxU2DSv8P2hTWxoLsbbOscf
	15+QBFbj3iSKsScDnWYX4G5po3X5VeSFBGP9IDETxsbP4frXWnYJmbumyWoSJly7T3ri7jtSn1q
	vbkNPMeLroBLWg5Clm3M8dJkUbQQ0Rki3zzJuYacy1ZpwQyQzDAVKgzEf5FADlAHeCCWWQZHTEP
	xZrWzCP4YXSO2VGOhrw7TBi063urQ=
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr15571040c88.38.1795560842325;
        Tue, 24 Nov 2026 14:54:02 -0800 (PST)
X-Received: by 2002:a05:701b:2817:b0:1b3:aceb:b8dd with SMTP id a92af1059eb24-1b556911012mr15571016c88.38.1795560841728;
        Tue, 24 Nov 2026 14:54:01 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm26179110c88.4.2026.11.24.14.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:54:01 -0800 (PST)
Date: Tue, 24 Nov 2026 14:53:57 -0800
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
Subject: Re: [PATCH v17 00/34] Introduce SCMI Telemetry support
Message-ID: <20261124145357.00003e9f@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-1-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX+kE1MQk6yhnc
 +alS+IUk9YoGNs3TOPPpVovMtnOpgyZwVExNnxAxk0qfuNqj8r20cS3gakedvGNV6YBXajNaFHP
 /piGRKoGXBJ2wpZegiB+lAr1EPaCShA=
X-Proofpoint-ORIG-GUID: w0LICMrc03r9oM7VES_mPce7nzhhxDnn
X-Proofpoint-GUID: w0LICMrc03r9oM7VES_mPce7nzhhxDnn
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06158b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=FV59EcnNoF-tUHG6_8cA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MCBTYWx0ZWRfX6JvBJpXaTEb/
 6YQNk68I9OB3wW4ZlywVPPRxC2XLFtC3P4dw7G+kCODBgLztjFCAO6MAfXiWsWJX06QePkeAFJy
 MfhDbJfT3lBuVhkpqPxbOaAYjX/PmpKzZINM7DntggEZHJ4FV1APVFMRzSy9hQOsnIbY6GlQKR5
 QWWJOlg5kr0MRrq9pP1rxoRkoryiqLpxvMi5GKrgCJt6FjXYehB414K94+qaUPATzap/RCoZbNO
 eCum5+kjsf9IOKXlmHKR6NhXfgfEqGgYM1G80nORZnZ2YuUhkhd1pr4u2XDMjTOpp3Se5uIQqMl
 KaX+3ew6i2vLZjz3gJAE6pS4pQhLz+YAKBIwVWtiBkYbOSiZnD1gwtjzvg3zMduOOWDxv71XMEP
 zUktMclWceGTUq+h43UfPlnEngDRkBzSjNCQfNNyRkLR3kY0l3WX25ianfkjfVtra6Nlz5mu5Ji
 /DyuCKeN2/V02W1FwAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_145403_871318_DED2AD80 
X-CRM114-Status: GOOD (  14.41  )
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

On Tue, 24 Nov 2026 19:48:06 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Hi all,
> 
> [TLDR Summary]
>  [V17 highlights]
>  - addressed more Sashiko reports
>  - added a few more SCMI Core fixes that ease per-protocol logic:
>    + added more consistency in the SCMI Core Iterators machinery
>    + added centralized check (SCMI Core) for truncated reply
>      + Reworked some SCM Clock behaviour to allow for truncated checks
>    + SCMI protocol core initialization refactor and fixes
> 
>  [V18 TODO]
>   - address any remaining outstanding Sashiko/reviewers issues
>   - address pending human reviews feedback
I'm lost.

Does this mean humans should wait for v18?  I'll assume not and
take a look anyway... 

Sashiko is moderately easy to run locally as long as your company
isn't too restrictive with tokens (if they are say upstream folk are
complaining and ask for more!). Might not be exactly the same
as the version here but will reduce the noise and versions on list.

Jonathan



