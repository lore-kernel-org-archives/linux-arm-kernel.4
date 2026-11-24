Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD72606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uricAHmr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DaYzFZsD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vz8txY1C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=; b=uricAHmre5olKI
	dA3l+MOmSI3PkDqLvcUzHk0XY30PnTTRRDP93q+JTTdv7RzbUbIF1hDYTnQvthJDiOEKNcNOb8stj
	N2BBPz2GrabKdZvYYgSD7vSLMvNmSjJgE2c4m/KPi4TI+KIXZe+ClrEyvTwn1xlosD9wLl0Yf5hdF
	M6L946v3iSEWrFFDd7F28Wj3sryzNcK+JnQfYhar1oXNgcib4pcOMxvvR00di5vvTsR0oiCw1ld/t
	rvACVGZTJQPujCUiiB7mwQrA9akj6uf07TCUBphYixtyD0u+3YQnqql7qqaI0tvIxo41eFzU55Ooo
	0UEytu/fLsBecVUUgi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0A6-000000085bm-3SWH;
	Tue, 24 Nov 2026 23:42:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0A3-000000085bF-3j7e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:42:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOMbE992289020
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=; b=DaYzFZsDbHmhOPgW
	ohtf7O2aDR3j1uhYhMagM5N5PcxjpIkbO40Pq7BnbIgf1e127zOT1h02zjV5U6GW
	xYvNHWfjdKIJ5kiai/qZl4H0diuC1W1cF9+cxzxw4cdGGr0Y+FnU73hxfeMQ7ESE
	u24XtZtnOmmihO5/z0C036Amck2Dw7QLHjck+M76h09mMjp/sWvVDHpl59OzPIsI
	OBnFKdD+8rOuMuRzP061C1SOynYs2dXCc66sqM0M3lbIdLZixX3j/6qJPEpc27/O
	TgMpIiOK9c01OVBZKoZ4hfpHhQTU3Im6jdupwHoA5gLKGfkIHMDj0F1TNophSXh3
	0bv8cA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egs9f63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 23:42:54 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b25d977b91so5481258c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 15:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795563773; x=1796168573; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
        b=Vz8txY1CkWbb0+xi0zdL/MRLZYHjxPgq/+rIYAl/tRn05WZws1qkkfjaHxgYVx0fWX
         LcClfWaa+Dl04OX0dNcV3tYIj+Xmrtw8hBCX2Dlg0NGoH1q6UNVARuCpg56MKZK5RGYI
         Ocq7im+BjfwEnOiCptmzfv8+6ZBbv65gzu+pftfYEbQxEQpDDvnofoDxIl3CQCS3g3HX
         4yNuI/n1Gqqjv87NJS/64CHBZe9gUfs0e6jEqo08dFZIFmCaemVV+UP5SYhT+vdDQNgL
         fmH0Imo0m0Kv/dDbu/TdMr7HMKOKPliZzKPuVZ3lj/CjncdlODbIP5ORhJ9844Eg1efY
         +1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563773; x=1796168573;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqVnxMuDZt6tT6zXcpMuhndEwJo916wGqastscvSmQ8=;
        b=vNdokYXdWUqmxfWEVw1BqU8ll8gWTSX3E0GyfQe0By3KrgL1qpnXxkyzO4+xnJUwFw
         dfngRCvfjSCBCHzvsuLG0q5A6o4guxWUjoElhqMjVjq3bhSNwjwXWDWn6YxwICUocQ67
         iBzQ5w0AH5nmxlshGDS9tHAvJ7Kw8HekQqOkOafQ+g96tApebn3r3qee74u5DL3zPSgj
         xJIMERZSe/yflMivK27jWiwkjCLyXmDWpYJDcnm4/rPjg4XmV0xUdI119iPmduj8mriz
         WtEo0iII3qiiGG9rWgLBE6hiuTJsReeGKaHpfYOUI5oc0EcJpflv6pbSDOdjO9UHFVib
         rplg==
X-Forwarded-Encrypted: i=1; AL+hErFbeUTh2rbz6b/DcPa35fP6/rrUHFPwmwg+AOksmdiUoXALPCEwZaFyFvPaFiV3jv4cK1GJ0eHBNAxUWg1LtFhh@lists.infradead.org
X-Gm-Message-State: APuU4Z/VPpDl2UMlW223wthkdGuKVWBlQzqxkiNyhwMJTLJ9GfrKZM7u
	1gCFJtbg7u7/2ZYYvyJToybuVyGk4tMX5cTRo/rIhd8LufyvjsEyJUvQBs6rzIyofk7eW76oSAb
	AfWRV4ujgt01UTEH0fsq/FLHNmi8MiHqWfH3aayxLQeaAU2a710EhgPzUpwBIXvesd24IZ3gDMb
	gunw==
X-Gm-Gg: AZFdTZdoZ/tPFYv+4vz2vxfc2v+7RR7TIpJZ8QaPuMpm3ngAgTsOJAIizoNC9KsnrIr
	9GSsW2ErxihdT3F1W/ONtOG8MGsmhBa3pH0TQ7EaQCwOVIh4fpkAWo356Ry0uF7qmhIisyBHan3
	SMExDipUJ3hT8v70B08V7PE1DibG8qsEmb433jtbYsIEW8uHR06sZKocmtu9QV3ZKvYqb7hxQzO
	LsHXCHRGUUQpl07t+ukt9eigvpQedUXEB7aKdx080m6vO3DMCfvruItnrxS4B7yHBgGYdbAiH+G
	7vCKubw/ojHbwu/e/ZpUfbklv5f//Gso0/c+PRnIKKtmsk2jbuQZovFaN4koNlWzKppu7V7C5Gk
	ut8cWely1ed0ICCwa3KMYURx/B1Ax9FZ1Cij6R3TsIQjMbW4KmXUz0d9gAKM3TGX5Tz4r+PgB2l
	4aQFl+qtfREgD5lIk9A4tO3fPWXdoU
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr15272372c88.4.1795563773022;
        Tue, 24 Nov 2026 15:42:53 -0800 (PST)
X-Received: by 2002:a05:7022:5e09:b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b5567c13a5mr15272345c88.4.1795563772474;
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm61388919c88.9.2026.11.24.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:42:52 -0800 (PST)
Date: Tue, 24 Nov 2026 15:42:47 -0800
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
Subject: Re: [PATCH v17 05/34] firmware: arm_scmi: Introduce a dedicated
 SCMI Errors header
Message-ID: <20261124154247.000075e6@oss.qualcomm.com>
In-Reply-To: <20261124194841.1147072-6-cristian.marussi@arm.com>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
	<20261124194841.1147072-6-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfXyucLWejJU9xN
 hrCegIkje9cA5l0xg+X/DqXkZOwiOQizxdbkVDx82Pq8o81w1IVhuyuVw8FAsZUK8pxTv2Vr14g
 8SNC08pJ2mCwj+KO310IyDmGi2SnDvxcmgGNmGI/7MrV5sSLcr03fFBu4O0Gy0V/GE7HV26F/lb
 rNBFDnPyEbkP4O46b2BU7KUDRTv+PDc5g8Ml51FX2Am2jf4OvboCNahhS+ieBy7cYfiAVF37eRd
 j9nAj2YvoG5YcozIGbMPHcOHTjPk8LTScAZCue1UXMphcyctD7fAgJeD3AcU8hqULxJouxeMzh8
 gKX0e9ixpHWOXv1kdltvVXjY7vm/jYd3L+91o9RhFTDdH2UOFT1lsA4NQNCTCo3Z9kRAEKidrGH
 U3kL/1JsfsVMmxSmdCRBRO5k+6onstMTG1sxmJxZgjqVR5Xeh00sClnMG+LyOAmGSofxOLpHRMk
 tpQDaLDMu0k3XCFK3vQ==
X-Proofpoint-GUID: YrH8g40JCrJVeMS0OUqsVEEoaL6_qB6R
X-Proofpoint-ORIG-GUID: YrH8g40JCrJVeMS0OUqsVEEoaL6_qB6R
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b0620fe cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=gAdJEDVPSiZ2okViQt8A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA5MyBTYWx0ZWRfX6/FJ9MOYvCwm
 swG6k2QDfyCgv69z8uQJ8GYjsGFWrKF7+rfHTzVX+0Nbf8RQTLOqYGlgzEmqGB/V8yM0o9LhJkk
 UalcAG51oyB00rHncb/WVQS9Z4eJHsU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_06,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_154256_050224_4927C0F2 
X-CRM114-Status: GOOD (  12.10  )
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

On Tue, 24 Nov 2026 19:48:11 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a new dedicated header and move all of the errors definitions and
> mapping helpers into it and out of common.h so that SCMI errors definitions
> alone can be easily included in protocol files without all of the unrelated
> additional stuff contained in common.h
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>


