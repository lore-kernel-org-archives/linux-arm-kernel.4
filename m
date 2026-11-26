Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8169606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JaAL/10g;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S5Nb80yC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TBcWjUGjb5VTLVVH3GK5ENa1hgDGV5BGChwYvbGOY8c=; b=JaAL/10gCanNR0
	aFYHiRrRzA6jPoeScOFjMvkABvuNBdc7IsRUrTep31yjgp7HP72AhPHV05hMGTyFlqgYRRcgsQpSp
	gYSukog1I3M9IOjsPWJEu2eC9YEbDV5P/f0KVmqaB5Nuk5P+sgeaK/8IFnWdJCiI+uHliFTCAL+ZO
	OaLdMI60eHvifp+LF+aQyeBwNHcP3/Oz1T2sSfL1QAaUm+G5FPENXbsUWivVgm+OdF7iPdz08js4f
	nueLRKJxx6APiR7jDG+MDkCjAM3PTu/dFvWNCdrbOdvTqI3F4Rz3nWjcpisNDQMEmGT0GhsfpYPhq
	U05vr9E2X4GpBaXoEBBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZvF-0000000DRsU-2Ocg;
	Thu, 26 Nov 2026 13:54:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZus-0000000DRnb-1clZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:53:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso6284093f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795701217; x=1796306017; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TBcWjUGjb5VTLVVH3GK5ENa1hgDGV5BGChwYvbGOY8c=;
        b=S5Nb80yCO+tXltD8Yx1qxrczYEaShU3pvD8ixz0uPoloBdzqb1+++csBhdxt6mGNB8
         XDmWMkevf98/GQ+64YQuuvGaGoHCwMgEO6c70dPGlzfAV+9Eei3VqDTkc57/lwbMCFd8
         4iLGuxGoyBMcNG+9f7HePlS6KO7Q1EhnlyuLIjZJ1EVSszkx3cPtAJK+Rz9vb1Q6/4sm
         qX/d/vwyEMrrPDV1zWHS3Ia1whquYcruXXEmHTfCbViLfeDbRKM7ki0iakjJmUYXUJs0
         0zy9BHEXdcaHa6AIbzKd9+2l9n9qfsMSXItd/JtEYfUEH2MRvfoxI13VsSF+98t1u6gz
         umdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701217; x=1796306017;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBcWjUGjb5VTLVVH3GK5ENa1hgDGV5BGChwYvbGOY8c=;
        b=kpjY9g4F5MCAX8nb/2FwYhGBuiNoAXART9qtmtlxV3gMFPmrsDbfSkDoGlMQolnyX3
         OHYerHjnIf2onU166pUUvl6vz7wTLdEBN7MGo1cLf5EnCIEtFQpBA93nkHsHAhdeolNK
         0wCGkxYi1IE+PzJDYokljqVfASp3hn8TJ3fuvnWn8Lv27+nN/Tcf6ALOrPuruUsNG9gO
         +Qw1v9ayMGNQs6qkxxIkyk3ghyGOwHijqkxfu+JKfdibuG2tHWvyaLQHfcq3Kxbwn4TH
         3CgillTLBbc+CuXsmBaXad/WFnv/bJw4KYE36CCnOb5ANNuZXxULT2oxYrWI4KPk5ZJK
         jTdQ==
X-Forwarded-Encrypted: i=1; AL+hErG5sJ0MqCFoCmsmHo9F3CP2VfXjskFHRzkuIg9WUq74FIt9rVvqZB4wl6sb0V5UbOIcEidCKAF9pU6OSfIb0ULU@lists.infradead.org
X-Gm-Message-State: APuU4Z8cAcr8aT9DolsFgmOsLbLASlmXw5V5l7oz4zolvIQfhGqnrft4
	YYU0U74GaPItTkzWbAntEK2etjpzxaXRfrdybSs0SqnBo68sS1F0SV4meL3CDCB0bY9Y8omKzdu
	0NBrG
X-Gm-Gg: AZFdTZebTrpF9B2IRuBiZ+aJhRbGnHP+uyHDy4Oba7u8R96S51tOX4tvglMUWStmt9z
	/7VycfEsT/FcEF4OakJWnRFNb2IVUHSS8LjmjklpQPfUMdC6MmoI6p9BoHLgC2rmPd63P2ZCbC+
	IWNx6IcuhRz3B100tYj8xm1b7S4XzhDDIn3ybqWVvmGtTgKL0TqbRJC3SyRVZjNXLzAbD1zgtU/
	iGjy+Gm2cHn8Leifv+8sOWehhXz6TCV6tTkg6uiKXoP2cyxkoUNq1yviUxyo+/ZBIOWAOeoxnnT
	fHDehWrgaNA7PKe1UDZxls0eKQ33G5rAGrTgJ5NGdeNAJNju9FzHwVI6cyfSV8ZcVUKRuOQ5NAu
	wAWdr6eyf2PLvLJJeTaMffR6kgTlu2V+3tLd9L90GdDpjeTcKtyS5geYLkRV+FVRbKErK8dSZ2i
	E7iOHKr3twMGLJre63BY7GmPFsgxzyHAbjItsv+y+NRCOb9B25JhNEwOIco3hPAafSy0M8YKxta
	D3Xq6MY0QXJFG6KM2/IhfJtJ3okT1Y7d+d4vkdpkdw/rfQc5mHVoOOTEgKM8gK1gtO0nSP3Zky4
	p7euoSDm++h4cVjRX0ADnBh1sw2UL5J9Fw==
X-Received: by 2002:a05:600c:3509:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb88814d16mr459329395e9.21.1795701216766;
        Thu, 26 Nov 2026 05:53:36 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm240161275e9.0.2026.11.26.05.53.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:53:36 -0800 (PST)
Message-ID: <fbc63046-18e1-49cc-a031-d936ba148317@linaro.org>
Date: Thu, 26 Nov 2026 13:53:35 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] perf cs-etm: Check frontend instruction reads
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Robert Walker <robert.walker@arm.com>
References: <20261113-perf_fix_gcc15_failure-v1-0-eae592c5ff64@arm.com>
 <20261113-perf_fix_gcc15_failure-v1-3-eae592c5ff64@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261113-perf_fix_gcc15_failure-v1-3-eae592c5ff64@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_055338_470614_BAA9FE4F 
X-CRM114-Status: GOOD (  24.59  )
X-Spam-Score: -2.1 (--)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 13/11/2026 10:54, Leo Yan wrote:
> Frontend instruction decoding needs a complete memory read rather than
> a byte count. Refactor cs_etm__frontend_mem_access() to return zero for
> a complete read and -EIO otherwise, while retaining the decoder memory
> callback's byte-count interface.
> 
> Propagate read errors through Thumb instruction size and address
> calculation. Skip samples whose addresses cannot be determined while
> preserving instruction period accounting, branch synthesis and packet
> processing.
> 
> Initialize the copied instruction length to zero, validate the size,
> and set the length only after reading all instruction bytes. Also check
> read errors before recognizing SVC instructions.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   tools/perf/util/cs-etm.c | 75 +++++++++++++++++++++++++++++++-----------------
>   1 file changed, 48 insertions(+), 27 deletions(-)
> 
> diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
> index 312d4a734e84faa0d24c4ac1fee16f4dae4c2398..303e16a54445bc62ce1c7d0e4ffeb1819211fd40 100644
> --- a/tools/perf/util/cs-etm.c
> +++ b/tools/perf/util/cs-etm.c
> @@ -1218,13 +1218,16 @@ static u32 __cs_etm__mem_access(struct cs_etm_queue *etmq,
>   	return ret;
>   }
>   
> -static u32 cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
> +static int cs_etm__frontend_mem_access(struct cs_etm_queue *etmq,
>   				       struct cs_etm_traceid_queue *tidq,
>   				       struct cs_etm_packet *packet,
>   				       u64 address, size_t size, u8 *buffer)
>   {
> -	return __cs_etm__mem_access(etmq, address, size, buffer, 0, packet->el,
> -				    tidq->frontend_thread);
> +	if (__cs_etm__mem_access(etmq, address, size, buffer, 0, packet->el,
> +				 tidq->frontend_thread) != size)
> +		return -EIO;
> +
> +	return 0;
>   }
>   
>   static u32 cs_etm__decoder_mem_access(struct cs_etm_queue *etmq, u8 trace_chan_id,
> @@ -1370,9 +1373,12 @@ static inline int cs_etm__t32_instr_size(struct cs_etm_queue *etmq,
>   					 struct cs_etm_packet *packet, u64 addr)
>   {
>   	u8 instrBytes[2] = { 0 };
> +	int ret;
>   
> -	cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> -				    ARRAY_SIZE(instrBytes), instrBytes);
> +	ret = cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> +					  ARRAY_SIZE(instrBytes), instrBytes);
> +	if (ret)
> +		return ret;
>   	/*
>   	 * T32 instruction size is indicated by bits[15:11] of the first
>   	 * 16-bit word of the instruction: 0b11101, 0b11110 and 0b11111
> @@ -1429,7 +1435,11 @@ static inline u64 cs_etm__instr_addr(struct cs_etm_queue *etmq,
>   		return addr + offset * 4;
>   
>   	while (offset) {
> -		addr += cs_etm__instr_size(etmq, tidq, packet, addr);
> +		int size = cs_etm__instr_size(etmq, tidq, packet, addr);
> +
> +		if (size < 0)
> +			return CS_ETM_INVAL_ADDR;
> +		addr += size;
>   		offset--;
>   	}
>   	return addr;
> @@ -1560,31 +1570,31 @@ static void cs_etm__copy_insn(struct cs_etm_queue *etmq,
>   			      struct cs_etm_packet *packet,
>   			      struct perf_sample *sample)
>   {
> +	int size;
> +
> +	sample->insn_len = 0;
> +
>   	/*
>   	 * It's pointless to read instructions for the CS_ETM_DISCONTINUITY
>   	 * packet, so directly bail out with 'insn_len' = 0.
>   	 */
> -	if (packet->sample_type == CS_ETM_DISCONTINUITY) {
> -		sample->insn_len = 0;
> +	if (packet->sample_type == CS_ETM_DISCONTINUITY)
>   		return;
> -	}
>   
> -	sample->insn_len = cs_etm__instr_size(etmq, tidq, packet, sample->ip);
> +	size = cs_etm__instr_size(etmq, tidq, packet, sample->ip);
>   
>   	/*
>   	 * The instruction length should always fit within sample->insn,
>   	 * but check it to prevent an out-of-bounds write.
>   	 */
> -	if (sample->insn_len > sizeof(sample->insn)) {
> -		sample->insn_len = 0;
> +	if (size <= 0 || (size_t)size > sizeof(sample->insn))
>   		return;
> -	}
>   
> -	if (packet->sample_type == CS_ETM_EXCEPTION && !sample->insn_len)
> +	if (cs_etm__frontend_mem_access(etmq, tidq, packet, sample->ip,
> +					size, (void *)sample->insn))
>   		return;
>   
> -	cs_etm__frontend_mem_access(etmq, tidq, packet, sample->ip,
> -				    sample->insn_len, (void *)sample->insn);
> +	sample->insn_len = size;
>   }
>   
>   u64 cs_etm__convert_sample_time(struct cs_etm_queue *etmq, u64 cs_timestamp)
> @@ -2011,11 +2021,13 @@ static int cs_etm__sample(struct cs_etm_queue *etmq,
>   			 */
>   			addr = cs_etm__instr_addr(etmq, tidq, tidq->packet,
>   						  offset - 1);
> -			ret = cs_etm__synth_instruction_sample(
> -				etmq, tidq, tidq->packet, addr,
> -				etm->instructions_sample_period);
> -			if (ret)
> -				return ret;
> +			if (addr != CS_ETM_INVAL_ADDR) {
> +				ret = cs_etm__synth_instruction_sample(
> +					etmq, tidq, tidq->packet, addr,
> +					etm->instructions_sample_period);
> +				if (ret)
> +					return ret;
> +			}
>   
>   			offset += etm->instructions_sample_period;
>   			tidq->period_instructions -=
> @@ -2227,8 +2239,11 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
>   		 * so below only read 2 bytes as instruction size for T32.
>   		 */
>   		addr = ret_addr - 2;
> -		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> -					    sizeof(instr16), (u8 *)&instr16);
> +
> +		if (cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> +						sizeof(instr16), (u8 *)&instr16))
> +			return false;
> +
>   		if ((instr16 & 0xFF00) == 0xDF00)
>   			return true;
>   
> @@ -2243,8 +2258,11 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
>   		 * +---------+---------+-------------------------+
>   		 */
>   		addr = ret_addr - 4;
> -		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> -					    sizeof(instr32), (u8 *)&instr32);
> +
> +		if (cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> +						sizeof(instr32), (u8 *)&instr32))
> +			return false;
> +
>   		if ((instr32 & 0x0F000000) == 0x0F000000 &&
>   		    (instr32 & 0xF0000000) != 0xF0000000)
>   			return true;
> @@ -2260,8 +2278,11 @@ static bool cs_etm__is_svc_instr(struct cs_etm_queue *etmq,
>   		 * +-----------------------+---------+-----------+
>   		 */
>   		addr = ret_addr - 4;
> -		cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> -					    sizeof(instr32), (u8 *)&instr32);
> +
> +		if (cs_etm__frontend_mem_access(etmq, tidq, packet, addr,
> +						sizeof(instr32), (u8 *)&instr32))
> +			return false;
> +
>   		if ((instr32 & 0xFFE0001F) == 0xd4000001)
>   			return true;
>   
> 

Reviewed-by: James Clark <james.clark@linaro.org>


