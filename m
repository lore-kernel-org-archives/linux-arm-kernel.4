Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC8E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 01:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HILh4mBM;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0vFrXLK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dJdsMJGK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=; b=HILh4mBMioa5j6
	81XXfZFlb4fUqiee4UAqQjQd9tJpLr4aiHqYwEpyV8zckfQiKa+Q+4eyFujc+7jA5H6EJtA0wP6d7
	dXHZZ++k7v1O5d3kdIbo7k7YGHxVAhO6HH8andnA836edlQRxF8IZKs2zrKrad/UefXBCPfRPXeqn
	j+fK+pVr1hqxQe+QauvVVLnHvnqKpjSo/8uOzerJQfaF/ZPDlYgIUzM3i9JwtSEMbZqKrpDC+klSn
	ls3jdjCxNYhIUGemVOZAX41PozrSxQDUUdbaiWcEq47+ZfQUge/erVMQG5L5m7chgPkonWWXUWaP1
	6bXoBidAryy7XF2X846w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTU8u-00000007QQ8-0Lry;
	Wed, 18 Nov 2026 01:07:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTU8r-00000007QPX-1IWF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 01:07:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHMgFTK3561145
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=; b=E0vFrXLKHchFOKxN
	ecQsM1ZRtXi0Ym6SsPb7jY1o5WiKjJH3ZSYYHxZYRHFZ9OI+gjScKS8IUSOxjr9I
	CkRGyFvhUGTsghPY4aYuRNVbbD1wVcdHGTvsFGxwNLIkGrZ0bLc0qPZ4zgXUdTfN
	70LfnKL458QRMf27y/T8m4066XpVDnpSmMezQ6wm9EXdSqkodGPQeLRPtTuU7jDc
	8XQJHvsxD1i6T/bcMZ6xC+pXsA9BM/K1DuNW0G0iznp/wWbxbXLsYD1CIWClOcSP
	1l02aOG641oFsNWQf4zaniM9hf5SlhcMKGaq8QzwvMrJZ0sJlq6JVFNSmh5cnsYx
	o6BmTQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcggk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 01:07:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-14373747468so454250c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 17:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794964034; x=1795568834; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
        b=dJdsMJGKZPDx/nOf9fqYvUNTAeNlPG7MBgWXln3BHqjkdjU4DhmozlA386RaJJ39Gq
         AgQdWwTYnk+XKzCAOJmLqLhmDHFyPTpSxzPbvlHq+Z8+c/3HGVgEQi31hr7/6LbesXL/
         aIfGKZcgxKNE8oqusObAyvj4uaNtPj42qHTB2v+QG035cU6k3qx5N5UuPWpj9WXx4K26
         htpI9Wtv8kInS57JGylbZb1PEsQcEerdsOLMod1W9ug1njWF1ZoDTFVqCjitREar/s7Z
         w+qHJUZ/1D3Xzk4lSW5z4RgYtWZS3Z4JhAWRkJn89g89Oa7aR8z8c5YVNqu6/wLbkMlR
         3dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964034; x=1795568834;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcTKtXZ3aPkAUgwqxkdywz0p3tJIPpV+oT5Yv4u3o7M=;
        b=h+K3FmN4R6YnQifjRtP6ZynMyLXx1Du7M2s8l0C3yJzCmZqpeY3QwzlvDZe8djyuJD
         9aw6BsRUlS4owgbTcJglElKFErdcumxLtArEd2HLQY6WaWAqdelWOMAk6mhaUv74A+sd
         Cf5NXl304o56Df76s3jncagYyu5xtaDwHcboWOuir5UZhbbeYxLu9LbMi9BCLfcUyaiv
         ijFii0CBturkMivJ1124MR/SjdrTrPtPmJZC5u3AkKA7+LZtM6NJYYMDsO0SvviLzkbK
         f4SeV+sNPp3rElJqqvK8QFHX05YJ5kCDWfMR/jFcxG/MEkMudQvMdHCraTUGsFaucvJK
         mukQ==
X-Forwarded-Encrypted: i=1; AL+hErHW9fXkplJnwqASQasuXSe1fr01q1fRTTbZ2cAv6zjqt9LDSxfW33OSBpXLdYT1QtnNH1Df2y3n7gTWX77W9RFH@lists.infradead.org
X-Gm-Message-State: APuU4Z84B+zM3cMzOtAst8/8c6IG9wAYq1Gbd80H1EAo/8PlMGRvxY0b
	l+gYlKZQZZQQDY0X+3ixkJxP8l0gags4JDKOjK0a6sWmhF1tyh6uu1mx0/9Btbd80IS1XXkwUZp
	v/UeDh4WfzA18w6CrGxshPKSQ/mfiKOah/lbdI5nSGbV8Mhjzfj7Rtbzn7NmZTt6QRNZqGrUYeq
	5g7g==
X-Gm-Gg: AYBFou3zYlNzXKZCwund2L+Tjwzj/eR+bSYzEfPvNXI4aZcZyUf7EjAMJ9iDyj1iooO
	K622LtpBp/+Ehs8Os00PTmbw6Q7WouZpKB3pJWbWAMc/7T6JB2qzEjzocI8racrCCKFFRCzNi1X
	TYUri+uJwbmxPjwcudbcIMeehQqYKvV3vb3vDCmq883w6k71ODF/MR9W6n4mxupqIZqDtlgCO7x
	tNaXPKmgQMdfgy7MNlmVCh6L/xgn1saeicLb+1osB9d14zBFduyy976FNe+UKCRuWWxWuFh4OxW
	5EL8e8BZngT/6wvuL7R2ZxmrtiSCEI9fvv7HweO86Tlg4zpAvNb3o3itQAjAp5mzXjebfjxwksJ
	ZFNn+lMvJhsKdh2SfECwD4bs+g9PKUkpfknkvDFzbCdinPsZ4swSwvNH/4iEfZDsiHVlmjen+W2
	lXNPu+gQVZcp8unThg7X0fTnlUc8I=
X-Received: by 2002:a05:701b:2901:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b543d0daf5mr1270254c88.23.1794964034428;
        Tue, 17 Nov 2026 17:07:14 -0800 (PST)
X-Received: by 2002:a05:701b:2901:b0:1b5:10cf:c458 with SMTP id a92af1059eb24-1b543d0daf5mr1270241c88.23.1794964033945;
        Tue, 17 Nov 2026 17:07:13 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544830c99sm3101462c88.15.2026.11.17.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:07:13 -0800 (PST)
Date: Tue, 17 Nov 2026 17:07:09 -0800
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
Subject: Re: [PATCH v15 00/35] Introduce SCMI Telemetry support
Message-ID: <20261117170709.00002088@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-1-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afcfa43 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=FHltUQ19mvutv370iQ0A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: bydfMu1fa4KLi0gIh6a5yo9H06nnu-ia
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAwNCBTYWx0ZWRfX/C4w0kEBHlEV
 n7xlTahA5FemUPXv1EChTm9vldH+ZQ3+PjetB3wg+yAFb0kAiZjQzbYk4tbkK6xvvWPx3qJOXrQ
 UMQGsKD0otEWXF+UccFRAo6MhpcGVFw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAwNCBTYWx0ZWRfXwQpEiQZVMaP3
 fzzhm27qdiTHq9jgNMQyG/kEmnEa3NS8uH7FdYf5cVNVEcVExLLceJ+Dv27PQ2fHyU7PFtf3Fh4
 Bw6ikIZEVJvwxHOdzk1L3N1NC6TEXpj0kdvX6m4/a1VN4akPdtgSjmHHWSwdqdc5+PESjAY9pAZ
 rLJsjazyeAo4Dn2UK8LbLPsSac+KFTz9lKSmD/Nt5XAzH4DIpFV75jg3Md3KsG6P2J0S5EAoerf
 cG+0lrdW/1MoGNkbQUgpn/aG/AsBksd+BGLEtWP5VOEQcgre7WtM6/G3K42luOHsgW1EZvlK/nG
 Ev2xemaE+9pvno5J3h/TxN0oe772Pz9APwy+XPWgmqjssVvMpUilzJzcYiVVbAOtEOPirNZ6ACm
 0HNOVG3xIHeSF97td8UlGlJFtH588Qihwsg/ODEpUbNhQ4tQ+2hXxLoVP9xbMmJOyx6gYvoGqsj
 YwI79/mqwwmBihbjl3Q==
X-Proofpoint-ORIG-GUID: bydfMu1fa4KLi0gIh6a5yo9H06nnu-ia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_170717_566203_BE687E6D 
X-CRM114-Status: GOOD (  17.68  )
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

On Mon,  9 Nov 2026 09:11:46 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Hi all,
> 
> [TLDR Summary]
>  [V15 highlights]
>  - general cleanup and hardening driven by reviews
>  - improved TDCF access routines to minimize lost samples under load
>  - completed ABI docs
> 
>  [V16 TODO]
>   - address any remaining V15 outstanding Sashiko/reviewers issues
> 
> The upcoming SCMI v4.0 specification [0] introduces a new SCMI protocol
> dedicated to System Telemetry.

This is one from the family of issues you find when reviewing ones own
(well LLM generated) emulation, realizing it doesn't match the spec,
and yet works.

This works fine without the required SCMI protocol property in ACPI.
2.2.2 of ACPI for System Control and Management Interface 1.0
Platform Design Document. 111115A 1.0

Now, in here is an informative statement...

Protocols not listed using a property may not be enumerate by the operating system.

But they are... 

So, obviously we can ignore informative spec lines but that is a pretty strong
sentence. I can't immediately think of what would go wrong if we ignored it
- maybe we'd not pick an exclusive PCC and fallback to a common one the firmware
doesn't want us to use?  But if it doesn't want us to use it why make Telemetry
discoverable on it.

Should that be wired through from the ACPI parsing code?

Anyhow, not something I care that much about but thought I'd call it out
as an oddity.

Jonathan

