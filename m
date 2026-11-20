Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E537F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yayb7vuk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SkLpz2Xo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=; b=yayb7vuk2Y3y95
	0IqsR9qnoM49C8sy6ULC9TJHDdxsVKoUmZa+0BqWy2AR8B1z2+e1HIypD8g3kQThPeNhK5C0pDksT
	B05b6FxE/oWmxmVY0j0UGpnfmAxmeh7kwF47Fmha+woqy6yIZMjvdAdYa+wz55FMXCP1yzg6zP1+Y
	AoZUi74thM2AsigZxJnbGIvcsjd629jldyHgIT/8W1YDgafW0ReCqWY+cTEezQWzoq92W0IwLWVAV
	gwy39ROnJNE7IeWUyQqLbeJ3LhB7JQtNv8oF6SgKjRFMVnM2H2VEs8FgEYUoNguRzZxx2ItUPl0QU
	MSAlE5XInzIoY0b8h6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSP2-0000000Fh5Q-2ST0;
	Fri, 20 Nov 2026 17:28:00 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSOx-0000000Fh3n-2JTx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:28:00 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-51f2e9e6987so1680135b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 09:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795195666; x=1795800466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=;
        b=SkLpz2XoDXLmliom678Eis4e6nZ9UzmhHP3bTvLAXg1giXxoBxn/0d6yg0IjwJ7fKx
         iMDmlw46RzovNAyvHWq/oq3TjWQGE+E3IpXWwCwP4vm9JryfGqHrj6tSQiYmALgiHmUJ
         T1irTgUl1GwQ93LJCwXbCH7DIE2OWlskD1YkP2LcrjguWXWBklxuQhLBPBnXe4Kqw7GM
         Hwk7nTd61fg3EKCPjTAaaTQVfw4UgJnKm6aOjDbR411kDHBIGNkTC8agUB+Fes4j8xGz
         tOwqb0mWNj0Q4YqNel28UPwSmjqCHr0S4Cd6gW9dG5NheVRIWnDuCEVjwrMNejqi76Ch
         O6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195666; x=1795800466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYJ744NugWVIMiKS0QCbcveofl6d6KXX/uG4XmRzDN4=;
        b=Ru7A7+W0uEjHb8nT/8nTa5qDzBb53/iDMgzG8VR/W9skV0STNhIwDAG3EcHeLMr5Y2
         3UCoEDyZJgR+EiVrEw121/ewY0qTijD3f901jWkLIbSr9+AYfL1PxQQYfVbzYQAoBAjV
         PL4//EDdGKzvIzROvJDGV7YwoVmADaXhuVQ/IZiAxwATOuBwLviVJi8mEIU52SIHEQsc
         SsrpSSt2cQ1PnWK/B4oGPCifd0F0TctJe99g3QchHmR3VJ4L3qA/NkY6F2DrPJL+Pt1I
         uP/XYZFh4yYcIy/h4IofgnUhDgOgBLYWsf87jGeUvpiL5o0nu0lDDjn5fWALf6JqihYf
         T/oA==
X-Forwarded-Encrypted: i=1; AL+hErFHXxaYnQUMkn/DDRSh6nBR10mkgf69hWayf1Uz8UhXJXGGCbzk2+2WI/FkXa8L/jaYPfbOBtiSavQrKAVCqmYI@lists.infradead.org
X-Gm-Message-State: APuU4Z+5NxjRfnDH72goynRzXRBsBPWoB/8MtCjgW8Lhjzzvz879Yb4i
	oa3BaVLX+gXBwtm/XdAjwH3Y8mSf0Km5gWyjPUbCmWbuaAUN5qCm618k
X-Gm-Gg: AYBFou0L5VyEzgcgl0E+7naJ+zhaMmioOjf6+LwA0mIOstgEtibek9snFnDoGoyRv5M
	kw74+le6DT+cDHIgW5hJ8BbJGcVpjC0/B6sHI7TdATGpwqJ1nMDrpwWNUt7hWh6Whi/Ksd1RQjK
	rurOiUCQ+OAOBesPUJ0Oh8BwnrboS6qVH7esU7ILr1herKGWWgtB4bAE5MMYx3JdyDPHSJpP874
	QJDcbRL3r8DKniUSSntOpmKJCKvW33fq1nDuTrUBefNEyw5VCOeK5qOxcPpxs06PUKVi546/BG2
	PptCGaML56LTEfVa5lLa3x4XJ5UF2UgzP0GuFBTKWunUHIHwNbTwetewZelh0omv5VirHJGEBER
	yxDTNYzoBg5BECXCBunAqkhdClTw2el2z982qNbZhPKKtPALxpL6JDdypbUNCENfW3Po3XVCw/c
	w1T7Ogd6gnAoyHjdT8Hu3ftJzkpzv3FI/CwqvV8kojy2RMjfxWJhDAXwMQOgjgbHgL367Ll08Jz
	UwO61qgsB8gcmuopUqKCPLPj/Ke/QZq3nDIYdCSbzmr27osqSXnX+mejbXZ7mCwT90aT+6Njoet
	jLamPAYChaTu8aa6nSalkJQ=
X-Received: by 2002:a05:6808:4f08:b0:4b8:46e3:e223 with SMTP id 5614622812f47-57a0a113076mr2651142b6e.15.1795195666573;
        Fri, 20 Nov 2026 09:27:46 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:4e::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm2473520b6e.9.2026.11.20.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:27:46 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Ingo Molnar <mingo@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Suyash Mahar <smahar@meta.com>,
	Amir Ayupov <aaupov@fb.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is throttled
Date: Fri, 20 Nov 2026 09:27:39 -0800
Message-ID: <20261120172739.1843303-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
References: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_092758_553245_731A7E68 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/10/2026 14:46, James Clark wrote:
> Reviewed-by: James Clark <james.clark@linaro.org>

Hi Suzuki, Mike, James, Leo,

Could this go in alone as a v7.4 fix, with Cc: stable@vger.kernel.org?
It does not depend on the rest of the series and applies cleanly to
v7.4-rc3.

Thanks,
Vlad

