Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xvERyJbi;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RvSrJur+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JzAQJv2b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=; b=xvERyJbirdLmu8
	1ErKxuSnK+fAhP5J4sGlK4qccQLNVdsXjnyxmaOKK9iWvUbbdxVjXRoYiiaOeaX1gyn/jgmyPt2VL
	eSiZGNAs/IseL1NbLheBQM71gSKbrNIcsOpOMVw0jJZv0++BzhxbC6LWp5dGdWZQ98nPtRSvUsceB
	hiDC4HuNlM3+LMgTDmP9FhDm0SmYnuDBBerXitcYTODnzIoXd5C7FRW7aq1wjcwPANjO4TsB/p/TN
	KrFy5HPlfMWu1Q3QMtupXm0erZtkUNSqYKfy4i5SjwpDQs7MtCNhziw/6vIvBi8P+gVhNvuAsKB1S
	8XJ2zjzJ78As4QTUtLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvgF-00000005GzY-0BLW;
	Tue, 10 Nov 2026 23:55:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvgB-00000005GzC-0PAG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 23:55:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKsPe486748
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=; b=RvSrJur+C7Q3n8AL
	zjxGsdpF4JAjs2TkgsUSFax51novUV/gWuNOBY9bR2hYMr+5g3dKI7L8MAw1RUgS
	ahREeWE3wwDuKFS3NpCGsORX1hfGhN37Wi46BALSWNXfwY3pb6zvewTAzs3mHu4b
	cXdtGcVFq/SOcUn3ajhzCa7CBIIU8A+xsvr5A/b1GqJ38eRS1zGk4/INMgZQsg90
	kkfsru0YWfqf9UR7l31J8wQsz8NaIDl9+WyeV8G7B7cf6AeH/fj8yvqkp+BEOlZx
	OIjlBKKPxjGZ/6mLx4/UXS346IOByZRCJe5uZWfXPyqmUQMpN4QvEgMC+iA5GMv9
	aWtYPQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtdcba8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 23:55:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37628596fc9so28919eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 15:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794354903; x=1794959703; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=;
        b=JzAQJv2b9FYlr4EbHM9aycCsPqBFTBQT1pxAssIpp9C1WjlS6Y9sG8siu1WC8MGF4a
         ZII1Kw3Vq2eIjQvEPZLIboMKw22XYUV3Ft3MBinHDWx2PV67Wd0hj8RfJIr16KpXy5V9
         tJ1RZ+CzOiiFRuKkMkE+HWNPlwIWCjrWtNps3cGDgXAKNas5yOZI7ARJo6C6L/crDRWC
         iU6aJTKXnPnIcMiDVYKs4rCv2fT9/2Qxrsc5EktwuSsxBvp56Xt35XnB0y1H7ozmatpC
         1XNalpz1BvmCnVx3a4H4if4pbM5t3jrcxpVfrGCq+eU72yBTahtrY7PNyhPNaqzVyToE
         A+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794354903; x=1794959703;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUql2wymmW69Kp3VegqeXpHQ2/+7j980FfOkqgfA5LI=;
        b=Dg/+I/qjCUW1DZI/VEWSyMfWOvev24DSR2GtieL0He4+LfLhFfSEoGT26HHtryxVPp
         JzvAObU8SNnQdJsyWwHQ1EJXgMV5VqpVwKPkgmNF0U+jeJOZz+q9IwICzzCDJKY5ZkTv
         DvhiU7OsBUxIrYhr5LusFJO+lc6gbpDq/7rfVK1kcPci6SUBI7cj5SVuv5NKBszZ5Gdb
         RYYoxX1OaCbjAovr2PG7TC1kGXGkqzc1WYYnsSEITCVucKE3szwxekZkahZMIZjlYJdC
         EQrQWjsB085bja0bI/N2/LOv75l9qzbaLUvQmHlL4R4DiDFh5xwQ7xV7uXJMk14W4hvP
         D+cA==
X-Forwarded-Encrypted: i=1; AL+hErFKxDQ/5Ku7RSAXH18zC9x5xUJdiC0uEeR2aUWoS624sQUrTgXRj87ItfdMtRNqsAHns57Hj3PqBCW+AxKyUTnx@lists.infradead.org
X-Gm-Message-State: APuU4Z+MIgD886fxcQpzSF3ToUV7Q+qm72ZsEvMBEvtC6fFz+E/7TGOK
	ha2es5pxIxsepC4CJ5+CQHBAq3aBzwv5jF29B+phTw3yz66ZTwwjG/605fpzNtIMSWKh9dBrjh8
	hl4LqL0ZCPK/+o+Xv5cSOW0hzFnM8ZWQp6HscmXHen7og9rQrL3xv5/GzNk5csuiCbwgvoAlxSB
	A10Q==
X-Gm-Gg: AYBFou3rLGRKrPJfBFF/+7WwZTM8vCJi/MACnzt1v0n7ltrPOahw6RXmA5e7z8ZowuW
	AhTp3sboI/edGOQy+kp5kndJ4O6rrYTstNsS3LnDZt7ItjRpUeJ6F82++qyhVSEehVpP+xX5Q41
	teXMytbvLSehZGfAPbhYNnllfMOvVTlXBOryLhltW4WVfDkHZi3utsrZoHmDoRY8SRiIaMNk6AK
	qr9iHc9BdUByqeyXwvVBiQh609bCr3uBs0TXXfQIvgqwT5kBH2JSx9UUihUBInafLTSgOtZACCM
	O4GmciODSDveewSFIKkhZJfzrOnFgIMCRz9/WIdouD0iVfCQAj9OkK1MnfelickoiMrF4g51ZVy
	CezTx9d8oakxC+U3+Yv3pD2EDXFtiSpLWEaiDbWFGByLuspaWwXt9j4MoqdE3FVn8/TF85v4jp/
	v/uvqpIFoiVTFu+khyNMJYEG8OEA6r
X-Received: by 2002:a05:7022:b0c4:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3c023cd8bmr667213c88.3.1794354903272;
        Tue, 10 Nov 2026 15:55:03 -0800 (PST)
X-Received: by 2002:a05:7022:b0c4:b0:13e:5a50:1e17 with SMTP id a92af1059eb24-1b3c023cd8bmr667173c88.3.1794354902630;
        Tue, 10 Nov 2026 15:55:02 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm21003960c88.10.2026.11.10.15.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:55:02 -0800 (PST)
Date: Tue, 10 Nov 2026 15:54:43 -0800
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
Subject: Re: [PATCH v15 33/35] Documentation: Add SCMI System Telemetry
 documentation
Message-ID: <20261110155443.00002e33@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-34-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-34-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pzhPKeA4g2vtdLPy5zF5eZkI4ub8LRde
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5NSBTYWx0ZWRfXznN37CJfMteo
 zOg11jULSxd/2N0YsVa33/pZWaN2MVB7sgqygnZ3021+B3jmO2PIZpP9qFODrWY+qetgikxx1vA
 kMmkO9uLIISSkQI8eTN7jXArHX0B2PM=
X-Proofpoint-ORIG-GUID: pzhPKeA4g2vtdLPy5zF5eZkI4ub8LRde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5NSBTYWx0ZWRfXwMbEsSwwGhP0
 ViNU/bffINQ77Hd7Pi3aHvIWcsV0dPE1eOKNGJy7Nnmcw6gTYS5HUU2aCLvIxGmLUGzaqOY63na
 rOTmWaEtt3RyfvrP9VqvgH02n/iY//7bCnat3KgdvciIVPeK4aJ9bkg4x6uml9uCdlYOUkb6WvR
 ANZtXgJhj/K6C9MbEqh0o3HcISBSeoJMX39KKggl28oCeOeGryIVX5MTebQOd7tawuef2KhZQDJ
 hq4D3lXWwxIlXXuS45Xew1obr+dqC50EOFgZAexcHpedSxkvzLk2s35Vp2JOxxGldhDTx0Fmp2g
 6CX+ENypPKJxaxQSushJoJQ7K3/aLqfPpNjJDG1t86lwSfzuT9OVMRzpzNtn0cDyr7Emswu8MF9
 KDDuieH8TfAu89A+u2up4vPtbdDfQCG2X5QnJNC1SOaQGD0uegd4tqyi6gJsXCQjkT+vbEhC79m
 qEunxu3GgUinIbU072Q==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af3aed8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=UJirIprmqi7MR36yQRAA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_155507_899812_B529D6D1 
X-CRM114-Status: GOOD (  32.71  )
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

On Mon,  9 Nov 2026 09:12:19 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Document ARM SCMI Telemetry IOCTLs interface.
> 
> Co-developed-by: Philip Radford <philip.radford@arm.com>
> Signed-off-by: Philip Radford <philip.radford@arm.com>
Various trivial things inline. For example code it is always
a balance between writing production quality stuff that
has lots of info that doesn't matter for docs, and over simplifying
to the point of ending with random broken code.

Here there is enough error handling to expect it to work but
there are cases where it doesn't. So tidy those up for consistency.

Jonathan


> ---
>  Documentation/userspace-api/index.rst |   1 +
>  Documentation/userspace-api/stlm.rst  | 590 ++++++++++++++++++++++++++
>  2 files changed, 591 insertions(+)
>  create mode 100644 Documentation/userspace-api/stlm.rst
> 
> diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
> index a68b1bea57a8..22daa7ebf78e 100644
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@ -54,6 +54,7 @@ Devices and I/O
>     dcdbas
>     vduse
>     isapnp
> +   stlm
>  
>  Everything else
>  ===============
> diff --git a/Documentation/userspace-api/stlm.rst b/Documentation/userspace-api/stlm.rst
> new file mode 100644
> index 000000000000..ea05a10d314f
> --- /dev/null
> +++ b/Documentation/userspace-api/stlm.rst
> @@ -0,0 +1,590 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=======================================
> +STLM - ARM SCMI Telemetry Userspace API
> +=======================================
> +
> +.. contents::
> +
> +Overview
> +========
> +
> +ARM SCMI is a System and Configuration Management protocol, based on a

Wrap docs to 80 chars.

> +client-server model, that defines a number of messages that allows a
> +client/agent like Linux to discover, configure and make use of services
> +provided by the server/platform firmware.

> +
> +Enumerating DataEvents
> +======================
> +
> +SCMI_TLM_GET_DE_LIST returns the DataEvent descriptors exposed by the
> +Telemetery instance. Users can size the request from
> +SCMI_TLM_GET_ABI_INFO.num_des or by issuing a zero-sized batch query.
> +
> +Example
> +-------
> +
> +.. code-block:: c
> +
> +	int main(int argc, char **argv)
> +	{
> +		struct scmi_tlm_abi_info abi = {};
> +		struct scmi_tlm_batch batch = {};
> +		struct scmi_tlm_de_info *des;
> +		int fd, ret, i;
> +
> +		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
> +		if (fd < 0)
> +			return fd;
> +
> +		abi.size = sizeof(abi);
> +		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
> +		if (ret) {
> +			close(fd);
> +			return ret;
> +		}
> +
> +		if (!abi.num_des) {
> +			close(fd);
> +			return ret;

returns success. Make that explicit with return 0;

> +		}
> +
> +		des = calloc(abi.num_des, sizeof(*des));
> +		if (!des) {
> +			close(fd);
> +			return -ENOMEM;
> +		}
> +
> +		batch.num_items = abi.num_des;
> +		batch.item_sz = sizeof(*des);
> +		batch.items = (unsigned long)des;
> +
> +		ret = ioctl(fd, SCMI_TLM_GET_DE_LIST, &batch);
> +		if (ret) {
> +			free(des);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		for (i = 0; i < batch.num_items; i++) {
> +			printf("0x%08x: %.*s size:%u type:%u unit:%u", des[i].id, 16,
> +				des[i].name, des[i].data_sz, des[i].type, des[i].unit);
> +
> +			if (des[i].flags & SCMI_TLM_DEINFO_GROUP)
> +				printf("group:%u", des[i].grp_id);
> +
> +			printf("\n");
> +		}
> +
> +		return 0;
> +	}
> +
> +Enumerating Groups
> +==================
> +
> +SCMI_TLM_GET_GRP_LIST returns the groups exposed by the Telemetry Instance.
> +Group descriptors report; the group ID, the number of DEs in the group, and
> +the number of update intervals supported by the group.
> +
> +SCMI_TLM_GET_GRP_DESC can then be used to retrieve the DE IDs of a specific
> +group.
> +
> +Example
> +-------
> +
> +.. code-block:: c
> +
> +	int main(int argc, char **argv)
> +	{
> +		struct scmi_tlm_abi_info abi = {};
> +		struct scmi_tlm_batch batch = {};
> +		struct scmi_tlm_grp_info *groups;
> +		int fd, ret, i;
> +
> +		fd = open("/dev/scmi/tlm_0", O_RDONLY | O_CLOEXEC);
> +		if (fd < 0)
> +			return fd;
> +
> +		abi.size = sizeof(abi);
> +		ret = ioctl(fd, SCMI_TLM_GET_ABI_INFO, &abi);
> +
> +		if (ret){
> +			free(groups);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		if (!abi.num_groups) {
> +			ret = 0;
> +			free(groups);
> +			close(fd);
> +			return ret;

			return 0;
rather than setting ret.


> +		}
> +
> +		groups = calloc(abi.num_groups, sizeof(*groups));
> +		if (!groups) {
> +			ret = -ENOMEM;
> +			free(groups);
> +			close(fd);

return an error rather than carrying on.

> +		}
> +
> +		batch.num_items = abi.num_groups;
> +		batch.item_sz = sizeof(*groups);
> +		batch.items = (unsigned long)groups;
> +
> +		ret = ioctl(fd, SCMI_TLM_GET_GRP_LIST, &batch);
> +		if (ret) {
> +			free(groups);
> +			close(fd);
> +			return ret;
> +		}
> +
> +		for (i = 0; i < batch.num_items; i++) {
> +			struct scmi_tlm_grp_desc desc = {};
> +			__u32 *de_ids;
> +			int j;
> +
> +			printf("group:%u des:%u intervals:%u\n", groups[i].grp_id,
> +				groups[i].num_des, groups[i].num_intervals);
> +
> +			if (!groups[i].num_des)
> +				continue;
> +
> +			de_ids = calloc(groups[i].num_des, sizeof(*de_ids));
> +			if (!de_ids) {
> +				ret = -ENOMEM;
> +				free(groups);
> +				close(fd);
> +				return de_ids;
				return -ENOMEM;
I'm curious if sashiko noticed your docs and spotted this stuff?
I guess it might be conservative as often such examples in docs
skip error handling.

> +			}
> +
> +			desc.grp_id = groups[i].grp_id;
> +			desc.num_des = groups[i].num_des;
> +			desc.composing_des = (unsigned long)de_ids;
> +
> +			ret = ioctl(fd, SCMI_TLM_GET_GRP_DESC, &desc);
> +			if (ret) {
> +				free(de_ids);
> +				free(groups);
> +				close(fd);
> +				return ret;
> +			}
> +
> +			printf("DataEvents:");
> +			for (j = 0; j < desc.num_des; j++)
> +				printf(" 0x%08x", de_ids[j]);
> +			printf("\n");
> +
> +			free(de_ids);
> +		}
> +
> +		free(groups);
> +		close(fd);
> +		return 0;
> +	}

...


