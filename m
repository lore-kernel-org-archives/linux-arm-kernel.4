Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064CF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eSqEIbUK;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CUa2qDGt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dvt4EOHQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=; b=eSqEIbUKy7ApZY
	Qev8CiWdL3h+eAxXEdjWIMbSB6i3oV3sTDBJVLnR6ZYd9mkRfLCV5qhCtef76CTmqhzAHdO3mtUH3
	++HhzAWzPvbKfvAqKEhXSpY41xV99S2WZaI8JJmyNjVugzNjxI1JC+IlVxDeTMFPIOTUXVMcMvEqh
	AEmEpNjT5PijcyUW/3G8BO4ZaaOdMEzvgVUNyGCEm7DpRiix7NmUgYz8cw0EkCUCc+kyuiFko3fht
	HLjsicncgTBGKkSTBxljfrXvmgAB1FmXtiziOmmahRxPjekgtSCupdGIsBEUst7WZhACB1s8bR/Uy
	XNjIO4TKDN/imJVHRWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0DZ-000000085pW-0xwM;
	Tue, 24 Nov 2026 23:46:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0DW-000000085pB-22oS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:46:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMajf0886177
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=; b=CUa2qDGttwLbSHCe
	3/pC86Ngts4KXgnbkhsDq/KclOuhAVRzaTqbMXG/Vg+On3NjvZqF1nm5/iSTOcm+
	tpP1nId2DuTIHQU4UbYXU4F4YToDCFwCAiTfAxw4r3S8BWbq7x7gxJpMCzan36d/
	v3Nmwt9JgL01GAFGwrpi53seHnHUhefzuDFplx2m8PSUAhWWcjIswqyk1+Bsasti
	W/+b53ygej1z4kJetQ9I/1B77I7q2JnCJKo+uFqRtwzjR1HHlABiLkYkPAMS45J+
	8dRr/QwxDemzJRrsJpMpS6TOhglWR4ggdG2gHR95jFd5toa9OogBGhjQ/LZyG877
	N8z3HA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rhcd1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:46:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so3944565eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 15:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563989; x=1796168789; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=dvt4EOHQdI8eLXeNsrNwouNyeKKyV6X4k99f/jh0ggMigWTn7k/TtlDqJV4wiDthtP
         dPJDUTFo6O3UAQsWOn/JjgtLv2Upx7VFumFQlwEcZwOmRbrG5I+W6Bao2v8jTng5Iln2
         ogz7ZwsFthHBEZyuKyMr5su0JOpcl2v3Crnoy309Bm0jZK6/DNIEhPNf4H9rDZKCVhL5
         1J59Ew3v3SsbQxkEHA+z0ahOQc2+mhR0nzxw+KmUruJ4TDY761tUoUs07kODfQ7uPb5T
         YUi4PnHlsL9hEIK17FmK5viMt+SkGe++C7BpZHf0KS/0hVN8xC9tDhi2/tLZSInrNEiX
         o/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563989; x=1796168789;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9PLOclrJUCEyLmOGP/JKvrxQpzGt+LITgqfp1kq59I=;
        b=WeH24+8dkT6OVJnZRyphn0zQs9uwXfD4y38XrZOizO4FrGCja+QIre61xBjxJHa3Uj
         BQWTgM/qj60Ccnvwlk+hDfn2a9ryl9+1DBGet4IT5Sy2k4+F9GlAUEAaQ2JqGmvBKIli
         d/p9cgO/kvDEhFYZIuwfSWusyMB4o8tDblRuq+X5R+wdW7gtB2S25s+czrQRl5w4qkQR
         wtmG3v2sL1VWPDisT6cs80Znblsyj/xTR5JvmqL5kEPlI2HRcwLHADrAakLSpYGCu2Vq
         /mCu/hZfdJjKDLBYyZplCxCGyoKaFzCUxYDyMrs4igny5QC5dnrL00ElhKfm4DDmMSH/
         tuPw==
X-Forwarded-Encrypted: i=1; AL+hErGpA3nIYIZ24XgpDgLo8orZPiKXJerByIIK7evRk4wTujHh548EovOAxLoJsQ4vmNeZ6Xrlc3Teqi3cB1noJHAm@lists.infradead.org
X-Gm-Message-State: APuU4Z8yjLHN0C2q6xro12yME5RnG2B5Ub7ac8WdPIZCjTyH+w/ph9Ig
	P7Axsn4qCemT6pAwnmleBaDaCjoTkdeTlTSmA1GchxZwBIxKf0vLGJgkGCf+/IeHaCU9F7MoEb6
	kfp+QIHQDuJv5GVrGSPGuG5VfYE4nm7bELFoGPf/UeaDG9nD0E3ChX6XgXq4uPMTT5r/MFuQxkM
	yqYA==
X-Gm-Gg: AZFdTZfHdlzGt3bWQJEAE0KhPJWgSFqnle0xW+rpeXZsl32TBt9x4SvuWiTcdwu022j
	yC/Ph2t6efPWm/pKfbaxGTyeKFIP8TCJWKhuf3pdbxSo/hDfw2t5kQy4HWLmRnRJyltAmFCcTWn
	x4eM6VaOvWh6LoH63N7WqGw6KyWkKt8c8VEMCymsEzPCdO36niE7EOuTo9MmxL5uwzOL+pOfzOr
	xSwZcHnsJ3SoQw7LqU0GMNUbCxjt0EeiUjqcW1gNUyGnQ9pQt1DvExkmXBbqH/XioMF4dM9nMD9
	CqweQxZbxwA9oGUxSgp1XflUEFVS2qS31Yz1iz6CGlEsWNx0oRMbAHHLekdcAR/54nf08cRkQAY
	NoqDMBK2AjguvHiQu9lnvZkNjZnzzxhwyX2nRbBhhgVO+tnvPV0UEdSSRBy0DZgx9LFlTosbx4G
	2f2EBK8ZUNDq5hLtj4SDJ7dtBPB2Fl
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027367eec.29.1795563988976;
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
X-Received: by 2002:a05:7300:e9d9:10b0:386:ce20:31c6 with SMTP id 5a478bee46e88-386ce20334emr1027324eec.29.1795563988410;
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm57314365eec.10.2026.11.24.15.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:46:28 -0800 (PST)
Date: Tue, 24 Nov 2026 15:46:23 -0800
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
        usama.arif@linux.dev, kernel-team@meta.com,
        "Rob
 Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v17 09/34] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <20261124154623.00000587@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-10-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-10-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b0621d5 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Cq6dmUWW68VXehLBlYkA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX4YtnEm9D0lUj
 TYsgl8aZye9B6ao41ShlM1N2L9r4hAdSR3IpT08t1RDSbHwH1juYt/bTPOlMLlHp5s9jcrewMJ3
 CJGbvVeM1XMQg6hSERDgcgyaUix8Nps=
X-Proofpoint-GUID: pc4_fRbYGfR5GG5PC9R8IdkgvjzDqMDk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfXxKztHy6SrKJW
 sFtoge9aiFGeE5ANdlZTtF11EVDFp/9e0TrCihcAPhucGa04xVW+JfyPjbboYXvEv2mn9RxdYNS
 awUAvo0s4pgoWdod32WZhCygm3yLAucsw5tUALXih0JH7R9/qgp3KZl84vt8BDCvjfxgg6O9EOT
 av5u+Zi+HPk3x/4zlsWxlRQUy4pmbzEDZgFne3oEr0GSkHo8OZmAs1OK+sLkM6hCNyN4X8qbXWT
 7E8Zpd83+YIKf4S6ij72M1TAFqfTLa+msAJkMo/CMUGlNRiy5/dUoTDYODNq5aH6rH6ezb8YVMB
 9aY81Olx7jLtl/8vtzz8FdNGk74+XOHsDdiLIF0CqSpO9x7PIJaxOWOHhNPLYem0nGE/s/T1oqg
 MWbrcxR/0JAG1bstGhvS22N5Zebx4twnYdJLRYxPE58CPC+5xHny14p8QhShUUL2WHuYlyD7qak
 cTgeLLc4950xOdjaD7A==
X-Proofpoint-ORIG-GUID: pc4_fRbYGfR5GG5PC9R8IdkgvjzDqMDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_154630_552197_2005EF97 
X-CRM114-Status: GOOD (  11.21  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 19:48:15 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

