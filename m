Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B6606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OeG90Dlb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L02Iwgpf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ynp9BnFU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ukfXMgMljG56TGff4D1CCtoxMKeKh2ELvZ0jC57C+PA=; b=OeG90Dlb6DFOQI
	yaAsk1ArYkekr8c8qaDc0aZmosKCnufESF0oWdO8EO8AemK27CnNR+BL7wiw+PWk3UGH1DlD1aQr/
	QTYGtzGL++Agge1M4SAM855f3SudMt9O5xanCAhxvxDYmSsslYOQ5RLZv50LOxY18syj/590JT51V
	ej9rwKv+zmt13Zli5WLsFEahlfCmq2C1bwv/92Vti0KW55PE3uimzPQ6DvtaqUqSYWkcqUaMmsA8j
	NHxuGzMTKkJVB5vpDHINjGLPn9P5jWv758KdHTVMuCPrW5k44aYDHJuWVDJwkFV+sHJOoMeja9K4F
	VsQraTQXgcG5FaXz28iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvyM-00000005HxC-2RH9;
	Wed, 11 Nov 2026 00:13:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvyI-00000005Hwn-1kWV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 00:13:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKu1q4155709
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukfXMgMljG56TGff4D1CCtoxMKeKh2ELvZ0jC57C+PA=; b=L02IwgpfCH28nKkn
	o7ML802NZ4WPIOUk9eTpvWQDs4il2ijVFnlIjmWXrM8zyU3dBCvZQnp6ZMlshWOz
	22QzWOWkFRGjO5lKAsWWMOdbdojxI72/Dx2PiOnqH1hkgzKgy76+FblhDvegbmln
	/UNDbp3cWq5p5c54XKGJQPASzGup4pY/+dr8BFJgXO1woYafueq1GX8yxHsBnhPc
	yC4j8JroS4irTrt4L364ManYcJ3uKBmp/cYHPswqEUeqXVNlq5ujV/waTqUPT7HB
	buqAn+fVcdbRamqRtQV16Dtjq2qJOu0JBX7AeShl440SPO0l/NcmoTPjAJsUzTeu
	CGSrDg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp4m83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 00:13:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso2127513c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 16:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794356027; x=1794960827; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ukfXMgMljG56TGff4D1CCtoxMKeKh2ELvZ0jC57C+PA=;
        b=Ynp9BnFUIh7XkJp5Sul0REJDTIE142D6oVBo+tMcDj4+Qe9+B+RBvwTBT3HXugtNVO
         jJUJnUWaC0r9+aKRxCtx0u17eaGq+pGUdY2iX4B2Vy7Qf8ccvNXZMVm3Psz59hTiZoLo
         PJjA5TITHPIZgyrRdrbWQiKys0hg9oM7uTJfz54kgBMFvjItodfZ6v8dK9YckhUys2Cb
         Za9lQ2ToY+4FTjAVdqMVEXx2pVPeEXzq3JLJl9yPUIUMVs/H4Pz9hDOEKO1hHM3l2Use
         LZqActfgAa5lwGKVzJ2/aoiaE0IqRh3fbYvTvZNbjr3uzBoEbwvpSXq58ku9VfEOd7q6
         wIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356027; x=1794960827;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukfXMgMljG56TGff4D1CCtoxMKeKh2ELvZ0jC57C+PA=;
        b=sz7LDv+eFNZ9uL4hrAdwcUf4JWdr12YBAcpz1BuWaKBw/6WBK02CBN6nLr8N3KcGQ4
         A3NbSFz9c5A6YmNrx96P6dY4xcLmK9Ahrct0U6t0I4QZK+US0Qjy+oNKShc6nBGdfvQr
         Ywp6tQqYFfG2wDKOQmKSMnzjma/6VnngCHmJVEeOLtXHGIsknk32iKzU98pkESCbbIRS
         xf+CaKXZXEoLKhOJKdC0ywr5umd7neh9C2hVrRoqKFz/JpHIvjdo6qg+lz8KFp4R/sqr
         O6Xmw5QfF4ihocDuQ+oB85XdPHsHZgA/Y3sZyWcsV8Ddgo7G8zz7RYf956WbNAQ+z61j
         Iklw==
X-Forwarded-Encrypted: i=1; AL+hErGgl/OVV66vQmObrBvyFqCLi8cLj4bnXwQl1J5oXhGv9HMIfuBOmrwoeAFlMlcvYXFWDlrV42uGpP850lPj+FuU@lists.infradead.org
X-Gm-Message-State: APuU4Z8/CHU5LRownmNe8dPw77nB+Vm47XdITAga9DYQB6kEf5nhXp9g
	7hmNeoX00aBzdjhMhxocIUvZzU0c2Du1l9PRdtfNqmXYMk9qn1zOA32U0mcDNjDMjkOcc3KGTcU
	7giH0PjIFGAJA7NGDd2cu1VEhXk2DzhtBodrk3QipnZoGQYn4U2h1j9pbflZ6UJeFe0KY603w9E
	mG/g==
X-Gm-Gg: AYBFou0XrgrZ3PxAS8qd8yOev5KxYRl1F8V9x3xNlDQKnXwAdAFxcDLKAXKNSplDWBR
	CaawLQ7PGRTdVcn7hRVxsPjxYgiXDnvFEdCmwkCRYJgrZRGovtA7IMRRSsNi6+WDj4QiwM2bX67
	xQ4Zxc/TFDt43oqrLASWv4l8TKjCjmEpeBY/yekmoQSuSP5w8ViqDBWpQVFBZN8v675vzX9v/nW
	as6d7XLY1vewosz+Ne/qs64B4Riud3+sKZbA5Z/uk73u6V2cu2QNst2o9P2raRif6zBc+fG5nRW
	YM7TnE55FAo+cDdjCNEeYfVHxLNWR96dBdSrjbdrjliHu078+vkcg7w/FPTCVBOM3/foK/A5meG
	M+HxiSTR+yyCWfSuwzBlwPITGcAhdOWIw8Ll4sB+ybvvgeXvkXkuXB+226ivmWrClF0vSI9+JT0
	+JEd4jKBVLcTWMddKwgy1C1dV7/ew=
X-Received: by 2002:a05:701b:2710:b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b3c02fb105mr705238c88.15.1794356027162;
        Tue, 10 Nov 2026 16:13:47 -0800 (PST)
X-Received: by 2002:a05:701b:2710:b0:1b3:aa92:b183 with SMTP id a92af1059eb24-1b3c02fb105mr705197c88.15.1794356026555;
        Tue, 10 Nov 2026 16:13:46 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm10948342c88.4.2026.11.10.16.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 16:13:46 -0800 (PST)
Date: Tue, 10 Nov 2026 16:13:28 -0800
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
Subject: Re: [PATCH v15 34/35] [RFC] kselftest/arm64: Add SCMI Telemetry
 UAPI compliance testcases
Message-ID: <20261110161328.000056c4@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-35-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-35-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: J3V4y2oqDb-rJO_i9Sfs9S3Txk_XACzf
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af3b33c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=Knn1SA45J_WYkMnPUZgA:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX3djNzm3Ex5E1
 MtFtVypVSY/Cfz2HeRSMDICaW/SRwFOcUofeaM0C1lHTNOaEOIQ8qRVMg7vPOliG4XLBpuuHedC
 wzmIvIcOdrkGnqGZ+fRVncO3G3nEzIXYQ8I2fA7n7lBhBjKvenLnxfkVmn1BgoTrwplNE8pm24B
 Wh13TSXF7KudRzQkK0ykh4Hx5ezCwo0ho1whsJqIsTDQ/ERVnd7lYsvgufgtUELaWRulVMmL993
 IXLQsjrpiz6Jgpj5QO4VjdEzlTmzyTo5ci9I1ZXZlQNNz8glgf4GunPIw+W+DhjbMB+pEw8+zd/
 yOaX9wGWs5+kV5mKc1UZDFSzTaJqgRm5beV6hPq/VqrENlqo65sGIiWf5BY3PcbRlMRTX+DDiu3
 +AfLGM6UqmTTPDTZFkFfiiLG+2WjA5XTQsgnsmotbCpeMWKzxg+84TZ5xEKNZGWmNsvshbhOQVJ
 0hAsYAa6u20CCYbtCaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAwMCBTYWx0ZWRfX2aCPKpqUqAb9
 K6i6nizuywagO2rHsOI9Fj9l3jKSjNnK1vPoKkCsqPrgxLcS0bmGXq/5b/UzIvwds2Gyk0a6aWZ
 h8SZU64pulXqQwjJI6rEvQ+RR5r3ZkU=
X-Proofpoint-GUID: J3V4y2oqDb-rJO_i9Sfs9S3Txk_XACzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_161350_488218_BA459CB8 
X-CRM114-Status: GOOD (  27.24  )
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

On Mon,  9 Nov 2026 09:12:20 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> From: Philip Radford <philip.radford@arm.com>
> 
> Add support to test SCMI Telemetry UAPI compliance testcases.

I'm thoroughly in favor of self tests, but rather less 1825 line patches!
I'd figure out an initial subset to propose of a few 100 lines then
build the rest up. Possibly just have a minimal set as part of first
series. 

I took a look at the code style for a few as not going to dig into whether
they are all functionally correct.
Given I'm assuming this LLM output, and those are pretty good at this
sort of test authoring I'm assuming they are probably ok.

Jonathan


> 
> Signed-off-by: Philip Radford <philip.radford@arm.com>
> Co-developed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

> diff --git a/tools/testing/selftests/arm64/scmi/config b/tools/testing/selftests/arm64/scmi/config
> new file mode 100644
> index 000000000000..63cd7e67ab55
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/scmi/config
> @@ -0,0 +1,2 @@
> +CONFIG_ARM_SCMI_SYSTEM_TELEMETRY=y
> +
> diff --git a/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c b/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c
> new file mode 100644
> index 000000000000..24a8170a4380
> --- /dev/null
> +++ b/tools/testing/selftests/arm64/scmi/test_scmi_telemetry_uapi.c
...
I commented on style for a few near the end.
> +
> +TEST_F(stlm, tlm_get_uuid_list)
> +{
> +	struct scmi_tlm_batch batch = {};
> +	struct scmi_tlm_uuid *uuids;
> +	int i, j;
> +	bool nonzero;

No other reason for order? Go with reverse xmas tree.

> +
> +	if ((ksft_session.info.abi_features & SCMI_TLM_ABI_FEAT_UUID_LIST) == 0)
> +		SKIP(return, "UUID list not supported");
> +
> +	batch.num_items = 0;
> +	batch.item_sz = sizeof(*uuids);
> +
> +	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_GET_UUID_LIST, &batch));
> +
> +	if (!batch.num_items)
> +		SKIP(return, "no UUIDs available");
> +
> +	uuids = malloc(sizeof(*uuids) * batch.num_items);
> +	ASSERT_NE(NULL, uuids);
> +	bzero(uuids, sizeof(*uuids) * batch.num_items);
> +
> +	batch.items = (__u64)uuids;
> +
> +	ASSERT_EQ(0, ioctl(self->fd, SCMI_TLM_GET_UUID_LIST, &batch));
> +	ASSERT_GT(batch.num_items, 0);
> +	ASSERT_EQ(sizeof(*uuids), batch.item_sz);
> +	ASSERT_EQ(0, batch.reserved);
> +
> +	for (i = 0; i < batch.num_items; i++) {
	for (int i = 0; ... 
> +		nonzero = false;
> +
> +		for (j = 0; j < SCMI_TLM_DE_IMPL_UUID_SZ; j++) {
		for (int j = 0; j < ...

> +			if (uuids[i].bytes[j]) {
> +				nonzero = true;
> +				break;
> +			}
> +		}
> +
> +		EXPECT_TRUE(nonzero);
> +
> +		TH_LOG("SCMI_TLM_GET_UUID_LIST - [%d] %02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
> +		       i, uuids[i].bytes[0], uuids[i].bytes[1],
> +		       uuids[i].bytes[2], uuids[i].bytes[3],
> +		       uuids[i].bytes[4], uuids[i].bytes[5],
> +		       uuids[i].bytes[6], uuids[i].bytes[7],
> +		       uuids[i].bytes[8], uuids[i].bytes[9],
> +		       uuids[i].bytes[10], uuids[i].bytes[11],
> +		       uuids[i].bytes[12], uuids[i].bytes[13],
> +		       uuids[i].bytes[14], uuids[i].bytes[15]);
> +	}
> +
> +	free(uuids);
> +}

> +TEST_F(stlm, tlm_get_uuid_list_bad_items_ptr)
> +{
> +	struct scmi_tlm_batch batch = {};
> +
> +	if ((ksft_session.info.abi_features & SCMI_TLM_ABI_FEAT_UUID_LIST) == 0)
> +		SKIP(return, "UUID list not supported");
> +
Where possible I'd assign structures with
	batch = (struct scmi_tlm_batch) {
		.num_items = 1,
		.items_sz = sizeof(struct scmi_tlm_uid),
		.items = 0, //Invalid pointer
	};
as that avoids having to zero explicitly and tends to end up more readable
than a wall of separate values being set in the same structure.
> +	batch.num_items = 1;
> +	batch.item_sz = sizeof(struct scmi_tlm_uuid);
> +	batch.items = 0;
> +
> +	ASSERT_EQ(-1, ioctl(self->fd, SCMI_TLM_GET_UUID_LIST, &batch));
> +	EXPECT_EQ(EFAULT, errno);
> +}



