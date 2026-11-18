Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1AC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e11ZZiBY;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=ity7tghI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CypiicFre4WBwXpeVK7ccOtlft0aGSxKx03rsPEEj/g=; b=e11ZZiBYjzB6hD71vHyuq2tinL
	ogYN7klmTiqkpk1KHxuXK3utupe5uDhtIr6TAD+lc4FuUJSoVAOC0L0srqatka4rqks+GYVb6e8qM
	NJrOGBzxCcsMZf6tq5zcPGrPBqFp8u/K8Urx7nJFRJmJhvQ8o2iSY7Cf4YdIINMj1Q6I3pN9IQZyA
	WB4qXQ/80nrnBDj+Ar2V3TlPVEFvicFE0IAWXLSTQYR3wrXZRUOM1keAzRwdGbOeDVrUq2eo7KvAj
	F9hLvN29+Df0P5SVi3Dlp7KOQZeXjpk3HldPFRsRuRdmIY023QuuveGez2GzfB9vt47HkvjrouKh1
	ZxixhLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiqp-00000009ZaZ-2Gw0;
	Wed, 18 Nov 2026 16:49:39 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiqe-00000009ZX7-1qgr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:49:30 +0000
DKIM-Signature: a=rsa-sha256; b=ity7tghIOZYfLhjtTnV5SWFkqmvLqm0FUum++BlONR49TMGyIQgT/rTgYsm3cuuFnV920idQQl1LzUy/GTFscKBAp6v1JpPk8aTrETB/HlYJg1gNZTXztNf7AOC3F8U5RD1+f2ItUnprJ0DQlMguQMtvGzpWUElzqa3zpQh0Owj0HF5NHxsv9X1RIgfcAprXbNxwg2gEuLkQHvjRpb+e5EyFANs8DHcleV6AcGJ3As0EW2y+ThBKkyukbkU8HZHkABVEOAAyAkx8CqnnHHCMIEg9GqGab2DiCzZMc8cQ2lwJZt611breWeD8XcK8nFst2nG7zvoF0FvEyUBkg/ZDgA==; s=purelymail1; d=purelymail.com; v=1; bh=PwCwEuAB6fs515WLXtAULsh+c1exq0+R5yemtdnUvHA=; h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 91259422;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 18 Nov 2026 16:49:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
	(envelope-from <peter@korsgaard.com>)
	id 1xTiqU-00000000BtX-2E5A;
	Wed, 18 Nov 2026 17:49:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Linus Walleij <linusw@kernel.org>,  Michal Simek <michal.simek@amd.com>,
  <linux-gpio@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <saikrishna12468@gmail.com>,
  <git@amd.com>
Subject: Re: [PATCH v2] pinctrl: zynqmp: Ensure function names are NUL
 terminated
In-Reply-To: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com> (Sai
	Krishna Potthuri's message of "Wed, 18 Nov 2026 16:48:16 +0530")
References: <20261118111816.2483052-1-sai.krishna.potthuri@amd.com>
Date: Wed, 18 Nov 2026 17:49:18 +0100
Message-ID: <87mrr6ultd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_084928_547810_986B467B 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

>>>>> "Sai" == Sai Krishna Potthuri <sai.krishna.potthuri@amd.com> writes:

 > PM_QID_PINCTRL_GET_FUNCTION_NAME returns the function name in a fixed
 > 16-byte field and does not guarantee NUL termination. A 16-character
 > name fills the entire field.
 > The driver copies this field into a 16-byte buffer and subsequently
 > uses it as a C string. For a non-NUL-terminated name, string operations
 > can read past the end of the buffer into the adjacent groups pointer.

 > Reserve an extra byte for the NUL terminator and explicitly terminate
 > the copied function name.

 > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
 > ---
 > changes in v2:
 > - Replace macro/constants with sizeof()(comment from David Laight)

Reviewed-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard

