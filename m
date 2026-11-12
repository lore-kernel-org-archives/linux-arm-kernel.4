Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6AC606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 04:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SEV58nph;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pswg6HdD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N+klPLXn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=; b=SEV58nphbSeW4x
	7EbBAh2jNNnVLZpmOZDYJuQn8DwEahi5MVsdk6sY0s82T7yzFz59kQyQtdpMOTye0a9y8lAdeckQE
	66Jz6CiOE4HZq0tDpsdyfDSYEMkQdEb2C2TOPROCvq0DNDYzaCSVK46XWBDaWZxJvJ3mZM41SUWiQ
	oP6QqAv8UnVTeUDkU7Sinqj7CGO4O2LAX29jmrZke1rydShoQFY+w530+5oFf1XBilf9H2REfi3yU
	laInrUAPGjXBCDHUUkAXCe0SQtuBbaOpqpyfQz6dOVKvm3j67P7R8dQIQHWQ7BV61Ccb0QHRgXHZE
	k0mXT0pARc6yLmOHAT+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMSA-00000008guA-0fJp;
	Thu, 12 Nov 2026 04:30:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRMS7-00000008gtH-3uxM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 04:30:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2aUeV1475361
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 04:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=; b=pswg6HdD47FUDh52
	oBdstQdQmPzqZoDfnsLVUQkhDmuqumK9WAGLA0qD+js7fngSxDth9PNvL6KHjjzt
	sR6ppFEGfdpTKsX4bFQx2FWaNjaJ6aFty6JJRXbR48b4uds93geUlJVqadIXh52b
	mCmoM2BSvmeVsTtJxPIBS0KXz5oyWR3hSJ44pv4dFiA3gw3eFeN/s1zz0mSXLtXQ
	Lvmbh+H5CQIG+2zvxPF4ikFXpfYekR7UBzNDMeCuep+PBTMPcqiof7ganY4OIWpU
	n30ajMI8Ca7UgJxOdRpxlQalowv0ABEgPYDjZ00tv+nZG90cDYUwqcZ4dpybgmiQ
	rUEgxQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymtmav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 04:30:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so7545586eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 20:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794457819; x=1795062619; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
        b=N+klPLXn7xVnEghDivngkwFxTVocdUgWoWZQ8beDzpKssP3LkKa/YIu70nyW0Uy6H/
         CTu0uOZVdx3z9LGY3fTqU2He+sykx0hHzZeFBOIqLMtB7JdS+4gkwMOK/WJ+YJhbWaSg
         Jkgqxo+6fyS6U58FIp5vLl49tgNAxI4ARlLMv/xbCl8Udi7novP3W9M90bjxNKn/2Sre
         pTl851c54hYdnd+gCFxKhxYcz/N9L6FuNX0jKxGDb5tgytmLYIERmhJr+zhL3a0gI+bt
         ABiVAGw8EO+MJ7BMkMFH2kRpgXq5MoC/HaenYiYRF8tvFL0L1w02VvjPxCXUysUrJ7J1
         K8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794457819; x=1795062619;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo53EQpUg0jWnHvwx/8Z+Iyb9X/XpywIVlFbq8/332k=;
        b=ENIQkzkYsRFpQiN8N34izhN3ZAJTCnpqu2x9Htb7epNlBcSHR41PIFvmBArGfbzLBh
         RTI6UkzSe0xCKW+t05hkb0TLA7wmN39ZLXHQQGt5QfnYGHSh7GFYukq6OwskjAHLXGzM
         CD4uVGYRXWEFX7tgTD3TX/Ws4LvHyTJ1H4LwyG+gyK+S4a4xj/c0OgYj0Y9VbpBfiiYN
         HRxVxU1qfu14w6FVYmnRgFl9cpDdrBFOZJx2KHd7tid3TVYhmb84O6RSkEum5KyM1Y6r
         90eujln5whAENrOMmjsJKlHAantNgw/k9zY70/ymj6zXVrXoe4qEsM7HYSpN4JT2AB5o
         75ew==
X-Forwarded-Encrypted: i=1; AL+hErHUGYb3wPCVEeitHDRBURmY1TidXaU6bnKYwvEBs1x24m8Y/WrcJ79O3VBeTnXKudN4mIU5p4VL531tm6wZQ4pw@lists.infradead.org
X-Gm-Message-State: APuU4Z+Bvf5a3WtyGAMjgXUNLnfTDA09TZRF7EYnkopiDl5bAk+oDd+r
	bN+48dp736bWCGYnPZFVNkF2T800NgJbm09x1VmDcXDK7D8IVZpb7eL17WqJWOimSj5dYi3Cpt4
	+V2Qrelcbadui/OFsKotumiuuG9PBs1jusZVo3y8fiOy8JDRn59IIlMYTIdTekrofrO/YMRSGIy
	8kDA==
X-Gm-Gg: AYBFou3lBsTpq5kXOF8aj11flYbbipCWi+5gAbWdoErFc5hphI5F9fB1T1y9I6AoPRP
	AP5QueGfGtokqjhb7rRmOJPjoheGwQfMAy8CGl4lQbNO1Q3z5ZvBuKfbMWHxGg6fKzoHsZgXfai
	PAAM+DOv4NFdWycfpKnFq9MPVTL/rK0M0tBQVCdAu9OoB0uOdQADbhWbBLAg7Z1vnUnMvUxuVZ2
	apUsvCJTylo+P/15e+Yz3V1G34donve39F6+tXeEu4JLTkM0nEoXEGaHAaeklvFmvpJ3PEzTkER
	X88GZvxZ/9r990gEELV7AHQKway0x4L1SxVFoUFxhOYzhhfzSaY3gIohCXqerF2AB1dL8Pv8dZm
	S1I76V2rUmXQyIMkEBE2omCiC/XRwQ5iDjESgPazYaxDUY2MNoWLB5Hdlk3j8S67e00s3ExogUp
	R+aBls63aWCly5aU8/7L0BpCgrraM=
X-Received: by 2002:a05:7022:7f01:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b3c030f6e1mr4080434c88.23.1794457819052;
        Wed, 11 Nov 2026 20:30:19 -0800 (PST)
X-Received: by 2002:a05:7022:7f01:b0:1b2:42db:8a54 with SMTP id a92af1059eb24-1b3c030f6e1mr4080408c88.23.1794457818345;
        Wed, 11 Nov 2026 20:30:18 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890584sm23163630c88.3.2026.11.11.20.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:30:18 -0800 (PST)
Date: Wed, 11 Nov 2026 20:30:03 -0800
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
Subject: Re: [PATCH v15 18/35] firmware: arm_scmi: Add Telemetry DataEvent
 read capabilities
Message-ID: <20261111203003.00007e46@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-19-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-19-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DQXIDL7ePMQRlGChWVv9UO4b2bmWZIxJ
X-Proofpoint-ORIG-GUID: DQXIDL7ePMQRlGChWVv9UO4b2bmWZIxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxNyBTYWx0ZWRfX166NO7nQzZ3E
 kGJI4wt9uJYPnAWQwdXmyUcYl9R5GQWwFYq1vElLYBcyjwB2iVALJWVjddA7iw9CaSAwQCJINqT
 9ygVuJxhY0Q4OyqM2UwqPD3fSU2qEnKUCZhENUr3784SNeW00jk2H/IQxq9JT9MWaqXunLQ5YPX
 VqWgW8XviSAIQfuF/Akf2qTwCtHV3sd1sOmK3Bwfjn7FHO3ID0UR+1yOTJF0I6fQ/bMKOW+frR8
 hQQOTHBfAoow++eYF+BaVmNn2K55VKVyB81IojV8DAr6eYAEovjrbzbWFpNF6dyFfjoqH5W08n+
 /KaWn8yATPJWh5ZO9FhEy2uJgZYe1AydbuRRQm0blqhA8RFPg5IouWiaRnmKjq8asfHDsesw6Mx
 1vCD2OHL8ECOHGR97mf10M/ZjAQYFCYuJFPoRHhplQZK9MyAvNBNK5Ab4eJl0QD0Z6VGKyfWzPB
 Nqy7lplTVF+deHDgCxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxNyBTYWx0ZWRfX5ZDx9YIFF3g1
 MKHj4kCdAaesrolRNeJr3aZb9uReVGAy4LjitKEUEDakPX5V9H/wktN0DwdZ55KxjyE3uoRBd32
 7MyZtMRa1wPKCr+6FkbrnNfrvB5BHMo=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af540de cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=bWY2Rz8DxC4JnhDb7tQA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_203024_190047_AE69C6C8 
X-CRM114-Status: GOOD (  16.96  )
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

On Mon,  9 Nov 2026 09:12:04 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add support for Telemetry operations needed to read DataEvent values and
> timestamps as single entities or all together in a single bulk buffer.
> The returned values are effectiely retrieved from the platform only
> when strictly needed, i.e. when no fresh recent cached value was already
> available.
> The DataEvent values are fetched transparently from the platform origins
> using the proper synchronization and consistency primitives, directly from
> the SHMTIs areas or the FastChannels memory depending on the configuration.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>


> +static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
> +					 int grp_id, unsigned int *num_samples,
> +					 struct scmi_telemetry_de_sample *samples)
> +{
> +	struct telemetry_info *ti = ph->get_priv(ph);
> +	struct scmi_msg_telemetry_config_set *msg;
> +	struct scmi_xfer *t;
> +	bool is_group;
> +	u32 control;
> +	int ret;
> +
> +	if (!ti->info.enabled || !num_samples || !samples ||
> +	    !ti->info.single_read_support)

Trivial but I think if it's not supported we should return appropriate error
to indicate that rather than -EINVAL.

> +		return -EINVAL;
> +

